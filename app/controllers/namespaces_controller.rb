class NamespacesController < ApplicationController
  before_action :process_params, except: [:create, :new]
  before_action :authenticate_user!, except: :show

  def create
    redirect_back fallback_location: root_path, alert: t('.exists') and return if Namespace.find_by(name: params[:group][:name])
    @group = current_user.create_group(params[:group][:name])
    redirect_to namespace_path(@group.name)
  end

  def new
    @group = Group.new
  end

  def show
    authorize! :read, @namespace
    @repositories = @namespace.repositories.order(updated_at: :desc).page(params[:page])
    @repositories = @repositories.where(is_public: true) unless user_signed_in? && can?(:update, @namespace)
  end

  def destroy
    authorize! :update, @namespace
    redirect_back fallback_location: dashboard_index_path, alert: t('.library_cannot_delete') and return if @namespace.name == 'library'
    @namespace.destroy unless @namespace.type.nil?
    redirect_to dashboard_index_path, notice: t('.namespace_deleted')
  end

  def settings
    authorize! :read, @namespace
  end

  private

  def process_params
    @namespace = Namespace.find_by!(name: params[:id])
  end
end
