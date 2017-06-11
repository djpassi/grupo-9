class ProjectsController < ApplicationController
  include CheckCategories
  include Secured

  helper_method :valid_action, :is_checked_project?


  before_action :set_project, only: [:show, :destroy, :edit, :update, :new_comment, :edit_categories]
  before_action :logged_in?, only: [:destroy, :edit, :update, :create, :new]
  before_action only: [:destroy, :update, :edit] {valid_action(Project.find(params[:id])[:user_id])}


  def new
    @project = Project.new
  end

  def edit
    @categories = Category.all
    @project_cat = @project.categories
  end

  def edit_categories
    @project.categories.clear
    @project.categories << Category.where(name:params["categories"])
    redirect_to edit_project_path(@project.id)

  end

  def search
      @projects = Project.search(params[:search])
  end

  def show_categories
      @projects = Category.find_by(name:params[:name]).projects
      @name = params[:name]

  end


  def index
    @projects = Project.all
  end

  def destroy
    @project.destroy
    flash[:success] = "Project deleted"
    redirect_to projects_url
  end

  def show
    @comment = Comment.new
    @investment = Investment.new
    session[:project_id] = params[:id]
    @back_url = session[:my_previous_url]
  end

  def update
    respond_to do |format|
       if @project.update(project_params)
         format.html do
           redirect_to @project, notice: 'Project was successfully updated.'
         end
         format.json { render :show, status: :ok, location: @project }
       else
         format.html { render :edit }
         format.json { render json: @project.errors, status: :unprocessable_entity }
       end

     end

  end

  def create
    @project = Project.new(project_params)
    @project[:current] = 0
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
    params.require(:project).permit(:name, :goal,
     :description, :limit_date,:photo,:categories).merge(user_id: current_user.id)
  end

end
