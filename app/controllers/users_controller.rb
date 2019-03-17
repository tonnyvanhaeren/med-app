class UsersController < ApplicationController

  def new
    @user = User.new
    @page_title = "Register"
  end

  def create
    @user = User.new(user_params)
    
    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @user.email.downcase!
    
    if @user.save
      # If user saves in the db successfully:
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      render :new
    end
  end

  def profile
    @page_title = "User Profile"
    @user = User.find(params[:current_user_id])
  end

  def update_profile
    @user = User.find(params[:current_user_id])

    if @user.update_attributes(update_user_params)
      flash[:notice] = 'User updated successfully'
      redirect_to(root_path)
    else
      render('profile')
    end
  end

  private

  def update_user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
