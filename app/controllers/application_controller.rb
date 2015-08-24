class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_path
  end

  
  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name
  end

  private
  def current_abilit
  	@current_ability ||= Ability.new(current_user)
  end
  
end