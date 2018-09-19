class ApplicationController < ActionController::Base
	
    before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_staff!
	
	helper_method :current_admin
	
	include Pundit
 	protect_from_forgery

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:company_id])
	end

	def pundit_user
		current_staff
	end
	
	protected
	def current_admin
	if current_staff && current_staff.admin?
		@current_admin ||= current_staff
	end
	end
	
end
