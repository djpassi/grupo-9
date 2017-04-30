class ProjectsController < ApplicationController


  def new
    @project = Project.new
  end

  def index
    @projects = Project.all

  end

  def show; end


  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html do
          redirect_to '/projects/new', notice: 'Project was successfully created.'
        end
      else
        format.html { render :new, status: 422 }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_project
   @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :user_id, :goal,
     :description)
  end

end
