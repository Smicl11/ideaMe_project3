class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
    render :index
  end

  def show
    @idea = Idea.find_by_id(params[:id])
    render :show
  end

  def new
    @idea = Idea.new
    @user = User.find_by_id(params[:id])
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id
    @user = User.find_by_id(params[:id])
    if @idea.save
      flash[:notice] = "Your idea has been successfully created!"
      redirect_to idea_path(@idea)
    else
      flash[:error] = "Uh oh! Looks like something went wrong. Try again."
      redirect_to new_idea_path
    end
  end

  def edit
    @idea = Idea.find_by_id(params[:id])
    @user = User.find_by_id(params[:id])
    render :edit
  end

  def update
    @idea = Idea.find_by_id(params[:id])
    if @idea.update(idea_params)
      redirect_to idea_path(@idea)
    else
      flash[:error] = "There was a problem saving your changes"
      redirect_to idea_path(@idea)
    end
  end

  def destroy
    @idea = Idea.find_by_id(params[:id])
    @idea.destroy
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:idea)
  end

end
