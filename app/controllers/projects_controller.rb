class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @project = get_project
    @comments = @project.comment_threads.order('created_at desc').page(params[:page])
    @new_comment = Comment.build_from(@project, current_user.id, '')
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
      redirect_to my_projects_path, notice: t('.message.success')
    else
      flash[:alert] = t('.message.failure')
      render :edit
    end

  end

  def my
    @projects = current_user.projects.order(id: :desc)
    render :my_project
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
