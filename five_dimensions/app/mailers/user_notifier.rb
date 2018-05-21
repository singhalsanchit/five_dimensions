class UserNotifier < ApplicationMailer
	default :from => 'singhal.sanchit1@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(request_params)
  	# debugger
    @user_info =  request_params
    mail( :to => request_params[:email],
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
