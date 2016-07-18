class Api::MembersController < ApplicationController
  before_action :validate_params

  # GET /api/projects/:project_id/members/
  def index
    head 403 and return unless current_user.can_read_project @project
    User.where(project: @project).where('username like ?', "%#{params[:username]}%").to_json
  end

  # GET /api/projects/:project_id/members/:id
  def show
    head 403 and return unless current_user.can_read_project @project
    {
      username: current_user.username,
      user_id: current_user.id,
      roles: current_user.roles(@project)
    }
  end

  # POST /api/projects/:project_id/members/
  def create
    head 403 and return unless current_user.has_project_admin_role @project
    head 404 and return unless user = User.find_by(username: params[:username])

    roles = current_user.roles(@project)
    head  :conflict and return if roles.count > 0

    params[:roles].each do |role_id|
      @project.add_member(user, Role.find_by(id: role_id))
    end
  end

  # PUT /api/projects/:project_id/members/:id
  def update
    head 403 and return unless current_user.has_project_admin_role @project
    roles = current_user.project_roles(@project)
    head 404 and return unless roles.count == 0

    @project.transaction do
      @project.members.delete @member
      params[:roles].each do |role_id|
        @project.add_member(@member, Role.find_by(id: role_id))
      end
    end
  end

  # DELETE /api/projects/:project_id/members/:id
  def destroy
    head 403 and return unless current_user.has_project_admin_role @project
    @project.members.delete @member
  end

  private

  def validate_params
    @project = Project.find_by!(id: params[:project_id])
    # TODO: raise error unless @project
    @member = if params[:id] == 'current' then current_user else User.find_by(id: params[:id]) end
  end
end
