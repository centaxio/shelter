module HarborHelper
  def title page_title
    content_for :title, page_title.to_s
  end

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end
end
