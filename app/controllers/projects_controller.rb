class ProjectsController < ApplicationController
  before_filter  :authenticate_user!, except: [:index, :show]

  def index
    if params[:q]
      @q = Project.ransack(params[:q])
      @projects = @q.result(distinct: true).where('projects.privacy = ?', :public).page(params[:page])
    else
      @projects = Project.where('privacy = ?', :public).order('id desc').page(params[:page])
    end
  end

  def show
    @user = current_user
    @project = get_project
    @comments = @project.comment_threads.order('created_at desc').page(params[:page])
    if @user.present?
      @new_comment = Comment.build_from(@project, @user.id, '')
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project =  current_user.projects.new(project_params)
    if @project.save
      redirect_to my_projects_path, notice: t('.message.success')
    else
      flash[:alert] = t('.message.failure')
      render :new
    end
  end

  def edit
    @project = get_project
  end

  def update
    @project = get_project
    if @project.update(project_params)
      redirect_to own_projects_path, notice: t('.message.success')
    else
      flash[:alert] = t('.message.failure')
      render :edit
    end

  end

  def own
    @projects = current_user.projects.order(id: :desc).page(params[:page])
    render :index
  end

  def user
    if UserProject.existed?(current_user.id, project_id)
      redirect_to my_projects_path, alert: t('.message.existed')
    else
      @my_project = current_user.user_projects.new(project_id: project_id)
      if @my_project.save
        redirect_to my_projects_path, notice: t('.message.success')
      else
        flash[:alert] = t('.message.failure')
        redirect_to projects_path
      end
    end
  end

  def my
    @projects = current_user.my_projects.page(params[:page])
    render :index
  end

  private
  def project_params
    params.require(:project).permit(:title,
                                    :category_id,
                                    :description,
                                    :user_id,
                                    :difficult_level,
                                    :cost,
                                    :time,
                                    :privacy,
                                    :tags,
                                    :cloneable,
                                    :picture,
                                    project_steps_attributes: [
                                      :id,
                                      :title,
                                      :description
                                    ],
                                    resources_attributes: [
                                        :id,
                                        :name
                                    ],
                                    services_attributes: [
                                        :id,
                                        :name
                                    ]
                                    )
  end

  def project_id
    params.require(:id)
  end

  def get_project
    Project.find(project_id)
  end
end
