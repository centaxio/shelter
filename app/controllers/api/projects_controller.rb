class Api::ProjectsController < ApplicationController
  before_action :process_params

  # PUT /api/projects/:id/publicity
  def publicity
    require_login!
    head 404 and return unless @project
    head 403 and return unless current_user.is_project_admin @project
    @project.update_attribute(:public, !!params[:public])
  end

  # POST /api/projects/:id/logs/filter
  def filter
    require_login!
    AccessLog.where(project: @project, keywords: params[:keywords]).where('username like ?', "%#{params[:username]}%")
      .where(op_time: (Time.at(params[:begin_time])..Time.at(params[:end_time])))
  end

  # GET /api/projects
  def index
    project_name = params[:project_name] ? "%#{params[:project_name]}%" : nil
    if params[:is_public]&.to_i == 1
      projects = Project.where(public: true)
    else
      require_login!
      if current_user.is_admin
        projects = Project.all
      else
        projects = current_user.relevant_projects project_name
      end
    end

    projects.map! do |project|
      if params[:is_public]&.to_i != 1
        project.role = Role.PROJECTADMIN if current_user.is_admin
        project.togglable = project.role == Role.PROJECTADMIN
      end
      project
    end
  end

  # GET /api/projects/:id
  def show
    head 404 and return unless @project
    head 403 and return unless current_user&.roles @project
    @project
  end

  # HEAD /api/projects
  # TODO: rails is not supporting head method here, change to other method later.

  # POST /api/projects
  def create
    require_login!
    # TODO: check params
    project = Project.create(user: current_user, name: params[:project_name], public: params[:public])
    redirect_to api_project_url(project), status: :created
  end

  private

  def process_params
    @project = Project.find_by(id: params[:id])
  end
end
