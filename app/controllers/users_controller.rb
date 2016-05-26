class UsersController < ApplicationController

  #this controller will route to the main page of the application
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    #If a user doesn't specify an avatar a default one will be automatically provided.
    if @user.avatar == ""
      @user.avatar = "/placeholder.jpg"
    end

    if @user.save
      flash[:notice] = "Welcome to ideaMe! Get ready to share your amazing ideas!"
      login(@user)
      redirect_to user_path(@user)
    else
      flash[:error] = "Looks like something is missing. Make sure everything marked * is filled in."
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    if @user == current_user
      render :show
    else
      flash[:error] = "You need to be logged in to do that."
      redirect_to users_path
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    if current_user == @user
      render :edit
    else
      redirect_to users_path
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if current_user == @user
      if @user.update(user_params)
        flash[:notice] = "Successfully Updated!"
        redirect_to @user
      else
        flash[:error] = "Please fill in all required fields (marked with *)"
        redirect_to @user
      end
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    flash[:error] = "Your profile has been deleted"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :profile_image, :password, :password_confirmation)
  end



end
