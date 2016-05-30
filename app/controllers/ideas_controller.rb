class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
    render :index
  end



end
