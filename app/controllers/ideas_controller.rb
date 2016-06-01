class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
    render :index
  end

  def show
    if current_user == nil
      flash[:error] = "Please login to view more about this idea."
      redirect_to ideas_path
    else
      @idea = Idea.find_by_id(params[:id])
      @new_comment = Comment.build_from(@idea, current_user.id, "")
      render :show
    end
  end

  def new
    if current_user == nil
      flash[:error] = "Please login to post a new idea."
      redirect_to login_path
    else
      @idea = Idea.new
      @user = User.find_by_id(params[:id])
    end
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

  def upvote
    @idea = Idea.find(params[:id])
    @idea.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @idea = Idea.find(params[:id])
    @idea.downvote_by current_user
    redirect_to :back
  end

  private

  def idea_params
    params.require(:idea).permit(:idea)
  end

end
