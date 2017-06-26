module Api::V1
  class ProjectsController < ApiController
    before_action :authenticate
    before_action :set_project, only: [:show, :destroy]

    def index
      @projects = Project.all
    end

    def show; end

    private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      if is_admin && @method == "update"
        params.require(:project).permit(:name, :goal,:description, :limit_date,:photo)
      else
        params.require(:project).permit(:name, :goal,:description, :limit_date,:photo).merge(user_id: current_user.id)
      end 
    end

  end
end
