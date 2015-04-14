class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @project = Project.new
  end

  def create

    @project =  current_user.projects.new(project_params)

    if @project.save
      flash[:notice] = t('.message.success')
      redirect_to root_path
    else
      flash[:alert] = t('.message.failure')
      redirect_to root_path
    end
  end

  private
  def project_params
    params.require(:project).permit(:title, :category_id, :description, :user_id, :difficult_level, :cost, :time, :privacy, :tags, :can_clone)
  end
end
