class ApplicationController < ActionController::Base
	protect_from_forgery prepend: true
    before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_staff!
	
	helper_method :current_admin
	
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:company_id])
	end
	
	protected
	def current_admin
	if current_staff && current_staff.admin?
		@current_admin ||= current_staff
	end
	end
	
end
