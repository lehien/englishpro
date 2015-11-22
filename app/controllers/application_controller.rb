class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "ここにアクセスするには、ログイン、または登録してください"
      redirect_to login_url
    end
  end
  
  def logged_in?
    !current_user.nil?
  end

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :name, :age, :gender) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password, :name, :age, :gender) }
    end
    
    
    
end
