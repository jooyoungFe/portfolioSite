class ProjectsController < ApplicationController
  before_action :set_project, only: :destroy

  def index
    @project = Project.new
    @projects = Project.with_attached_files.order(created_at: :desc)
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "프로젝트가 등록되었습니다."
    else
      @projects = Project.with_attached_files.order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: "프로젝트가 삭제되었습니다."
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :tech_stack, files: [])
  end
end
