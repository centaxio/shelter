class HarborController < ApplicationController
  # translate the horrible harbor routes in this ugly way

  def index
  end

  # GET /dashboard
  def dashboard
  end

  # GET /project
  def project
  end

  # GET /repository
  def repository
    @harbor_reg_url = ENV['HARBOR_REG_URL']
  end

  # GET /sign_up
  def sign_up
    # TODO: check if authmode is db_auth
    @add_new = false
  end

  # GET /add_new
  def add_new
    if @add_new = current_user && current_user.is_admin # TODO: && authmode == 'db_auth'
      render action: 'sign_up'
    else
      render plain: 'Status Unauthorized.', status: 401
    end
  end

  # GET /account_setting
  def account_setting
  end

  # GET /change_password
  def change_password
  end

  # GET /admin_option
  def admin_option
  end

  # GET /forgot_password
  def forgot_password
  end

  # GET /reset_password
  def reset_password
    return redirect_to root_path unless params[:reset_uuid]
    user = User.find_by(reset_uuid: params[:reset_uuid])
    return redirect_to root_path unless user

    @reset_uuid = params[:uuid]
  end

  # GET /search
  def search
  end

  # POST /login
  def login
    user = User.login(params[:principal], params[:password]) # TODO: User#login
    if user
      session[:user_id] = user.id
      session[:username] = user.username
    else
      render plain: 'Status Unauthorized.', status: 401
    end
  end

  # GET /log_out
  def log_out
    reset_session
    render plain: ''
  end

  # POST /reset
  def reset
    user = User.find_by!(reset_uuid: params[:reset_uuid])
    user.password = params[:password] if params[:password]
    return render plain: "Error occurred in reset password: #{user.errors.join("\n")}" unless user.save
    render plain: ''
  end

  # POST /userExists
  def userExists
    user = User.find_by(params[:target].to_sym => params[:value])
    render json: !!user
  end

  # GET /sendMail
  def sendMail
    user = User.find_by!(email: params[:email])
    # TODO: send mail
  end

  # GET /language
  def language
    # TODO: check if params[:lang] is supported
    session[:lang] = params[:lang]
    redirect_to request.headers['Referer'] + params[:hash]
  end

  # GET /optional_menu
  def optional_menu
    @username = current_user&.username
    @allow_add_new = !!current_user&.is_admin # and authmode == 'db_auth'

    render layout: false
  end

  # GET /navigation_header
  def navigation_header
    render layout: false
  end

  # GET /navigation_detail
  def navigation_detail
  end

  # GET /sign_in
  def sign_in
    @auth_mode = 'db_auth'
    render layout: false
  end
end
