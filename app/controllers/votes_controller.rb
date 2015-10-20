class VotesController < ApplicationController
  before_action :load_votable

  def new
    @vote = @votable.votes.new
  end

  def create
    @vote = @votable.votes.new
    @vote.user_id = current_user.id
    if @vote.save
      redirect_to questions_path
    end

  end

  private


  def load_votable
    resource, id = request.path.split('/')[1,2]
    @votable = resource.singularize.classify.constantize.find(id)
  end
end
