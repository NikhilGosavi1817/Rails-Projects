class ProjectsController < ApplicationController
    include ApplicationHelper
    def new
        @project = Project.new()
    end

    def create
        @project = current_user.projects.new(params_project)
        current_user.projects << @project
        redirect_to root_path, notice: "Project Created"
    end

    def params_project
        params.require(:project).permit(:name ,:description)
    end

    def index
        @projects = Project.all
        @projects=sorting_table(@projects) if params[:sort].present?
        @projects = @projects.paginate(page: params[:page], per_page: 10)
    end

    def show
        @project = Project.find(params[:id])
        @tenders = @project.tenders
        @tenders=sorting_table(@tenders) if params[:sort].present?
        @tenders = @tenders.paginate(page: params[:page], per_page: 10)
    end
end
