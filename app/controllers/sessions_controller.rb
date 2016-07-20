class SessionsController < ApplicationController
  def new
  	
  end
  def create
		user = User.find_by(email: params[:session][:email].downcase)
  		
		if user && user.authenticate(params[:session][:password])
  		
  			#Log the user in and redirect to the user's show page
  		     log_in user
            params[:session][:remember_me] == '1' ? remember(user) : forget(user) 
            redirect_back_or user
           #remember user
  		     #redirect_to user
           
  	else
  			flash.now[:danger]	= 'Invalid email/password combination'
  			#create an error
  			render 'new'

  	end
      
  end

    
 def destroy
    log_out if logged_in?
    redirect_to root_url
  end

   # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end



end
