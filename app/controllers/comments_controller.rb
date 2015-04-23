class CommentsController < ApplicationController
  before_filter  :authenticate_user!, except: [:index]

  def index
    @project = get_project
    @comments = @project.comment_threads.order('created_at desc').page(params[:page])
  end

  def create
    @user = current_user
    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body])
    if @comment.save
      render partial: 'comments/comment', locals: {comment: @comment}, layout: false, status: :created
    else
      render js: "alert('error saving comment');"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.owner?(current_user)
      if @comment.destroy
        render json: @comment, status: :ok
      else
        render js: "alert('error deleting comment');", status: 401
      end
    else
      render js: "alert('Do not have permission to delete this comment');", status: 401
    end
  end

  private
  def project_id
    params.require(:project_id)
  end

  def get_project
    Project.find(project_id)
  end
end
