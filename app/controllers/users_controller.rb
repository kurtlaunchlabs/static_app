class UsersController < ApplicationController
  
 

 def show
    @user = User.find(params[:id])

   # debugger
  end
  def new
    @user = User.new
  end

  def create 
  	@user = User.new(user_params) 
    signuser = @user 		# Not the final implementation!
  	if @user.save
  			 flash[:success] = "Welcome to the Sample App!"
         sign_in signuser
         sign_in_remember signuser
  		     # Handle a successful save.
  		     redirect_to @user

  	else
  		render 'new'
  	end
  end

  private 
  def user_params
  	params.require(:user).permit(:name , :email , :password , :password_confirmation)
  end

end
