class HomeController < ApplicationController

	def index
		
	end

	def send_request
		if params
			UserNotifier.send_signup_email(params).deliver
			redirect_to root_path
		else
			redirect_to root_path
		end
	end
end
