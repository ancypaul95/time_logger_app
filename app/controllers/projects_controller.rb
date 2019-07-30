class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end
  def create
    @project = Project.new(project_params.merge(manager_id: current_user.id))
    respond_to do |format|
      if current_user.manager?
        if @project.save
          format.html { redirect_to @project, notice: 'Project was successfully created.' }
          format.json { render :show, status: :created, location: @project }
        else
          format.html { render :new }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    else
      format.html { render :new }
      format.json { render json: { errors: 'Unauthorized' }, status: :unauthorized }
    end
  end

  def show
  end

  def index
  end

  def update
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
