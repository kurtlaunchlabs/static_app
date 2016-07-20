class UsersController < ApplicationController
  
 before_action :logged_in_user, only: [:index,:edit, :update]
 before_action :correct_user,   only: [:edit, :update]
 before_action :admin_user,     only: :destroy


  def index
 @users = User.paginate(page: params[:page], :per_page => 3)
  end

 def show
  logged_in_user
  @user = User.find(params[:id])

   # debugger
  end

   def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def new
    @title = 'Submit to Register'
    @user = User.new
  end
  def edit
    @title = 'Save Changes'
    @user = User.find(params[:id])
  end

  def create 
  	@user = User.new(user_params) 
    		# Not the final implementation!
  	if @user.save
        signuser = @user 
  			 flash[:success] = "Welcome to the Sample App!"
         sign_in @user
         sign_in_remember @user
  		     # Handle a successful save.
  		     redirect_to @user

  	else
  		render 'new'
  	end
  end

  def update
   
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
         flash[:success] = "Profile updated"
        # Handle a successful update.
          redirect_to @user
      else
        render 'edit'
      end
  end


  private 
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
 # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_path
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
