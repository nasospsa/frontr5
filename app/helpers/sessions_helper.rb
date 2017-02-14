module SessionsHelper
	def sign_up_action?
		['sign_up', 'create_user'].include?(action_name) || @session.respond_to?(:password_confirmation)
	end
end
