class UsersController < ApplicationController

  def index
    redirect_to ideas_path
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    #If a user doesn't specify an avatar a default one will be automatically provided.
    if @user.avatar == ""
      @user.avatar = "/assets/placeholder.jpg"
    end

    if @user.save
      flash[:success] = "Welcome to ideaMe! Get ready to share your amazing ideas!"
      login(@user)
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  def edit
    @user = User.find_by_id(params[:id])
    if current_user == @user
      render :edit
    else
      flash[:error] = "You are not authorized to preform this function."
      redirect_to :back
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if current_user == @user
      if @user.update(user_params)
        flash[:notice] = "Successfully Updated!"
        redirect_to @user
      else
        flash[:error] = @user.errors.full_messages.join(", ")
        redirect_to :back
      end
    else
      flash[:error] = "You are not authorized to preform this function."
      redirect_to :back
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    if current_user == @user
      @user.destroy
      flash[:error] = "Your profile and all of your ideas have been deleted"
      redirect_to root_path
    else
      flash[:error] = "You are not authorized to preform this function."
      redirect :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :password, :password_confirmation)
  end

end
