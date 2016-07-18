module Api
  class ApplicationController < ActionController::API

    def require_login!
      # TODO: raise error unless current_user
    end

    def current_user
      authenticate_with_http_basic { |username, password| User.login(username, password) } || User.find_by(id: session[:user_id])
    end
  end
end
