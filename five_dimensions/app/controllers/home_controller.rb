class HomeController < ApplicationController
	require 'sendgrid-ruby'
	include SendGrid
	
	def index
		
	end

	def send_request
		if params[:name] and params[:email] and params[:message]
			from = Email.new(email: 'events@5dimensions.co.in')
			to = Email.new(email: params[:email])
			subject = "Query from #{params[:name]}"
			message = "Hi Guys, a query has been raised by #{params[:name]} (#{params[:email]}) as #{params[:message]} ."
			content = Content.new(type: 'text/plain', value: message)
			mail = Mail.new(from, subject, to, content)
			
			# debugger

			sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
			response = sg.client.mail._('send').post(request_body: mail.to_json)
			puts response.status_code
		end
		redirect_to root_path
	end
end
