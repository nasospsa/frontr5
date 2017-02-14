module ApplicationHelper
	def logged_in?
		session[:auth].present?
	end
end
