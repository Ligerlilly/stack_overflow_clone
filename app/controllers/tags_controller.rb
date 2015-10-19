class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to new_question_path
    else
    
    end
  end

  def edit

  end

private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
