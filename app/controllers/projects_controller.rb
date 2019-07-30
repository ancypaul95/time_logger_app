# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[show edit update destroy]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params.merge(manager_id: current_user.id))
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit; end

  def index
    @projects = Project.all
  end

  def update
    if @project.update(project_params)
      format.html { redirect_to projects_url, notice: 'Project was successfully updated.' }
      format.json { render :show, status: :created, location: @project }
    else
      format.html { render :new }
      format.json { render json: @project.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
