class Api::LogsController < ApplicationController
  before_action :require_login!

  # GET /api/logs
  def index
    start_time = Time.at params[:start_time].to_i if params[:start_time]
    end_time = Time.at params[:end_time].to_i if params[:end_time]

    lines = if params[:lines] then params[:lines].to_i else if !start_time && !end_time then 10 end

    logs = AccessLog.joins(:user).where('project_id in ?', ProjectMember.where(user: current_user).distinct(:project_id).map(&:project_id)).order(op_time: :desc)
    logs = logs.where('op_time >= ?', start_time) if start_time
    logs = logs.where('op_time <= ?', end_time) if end_time
    logs = logs.limit(lines) if lines
  end
end
