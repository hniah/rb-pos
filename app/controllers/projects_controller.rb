class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @project = Project.new
  end

  def create
    @project =  current_user.projects.new(project_params)
    if @project.save
      redirect_to edit_project_path(@project), notice: t('.message.success')
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
      redirect_to edit_project_path(@project), notice: t('.message.success')
    else
      flash[:alert] = t('.message.failure')
      render :edit
    end

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
                                    project_steps_attributes: [
                                      :id,
                                      :title,
                                      :description
                                    ])
  end

  def project_id
    params.require(:id)
  end

  def get_project
    Project.find(project_id)
  end
end
