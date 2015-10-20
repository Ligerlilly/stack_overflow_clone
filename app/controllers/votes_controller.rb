class VotesController < ApplicationController
  before_action :load_votable

  def new
    @vote = @votable.votes.new
  end

  def create
    if params[:answer_id]
      @votable = Answer.find(params[:answer_id])
      @vote = @votable.votes.new
    else
      @vote = @votable.votes.new
    end
    @vote.user_id = current_user.id
    begin
      if @vote.save
        redirect_to question_path(@id)
      end
    rescue ActiveRecord::RecordNotUnique
      redirect_to question_path(@id)
      flash[:alert] = "You have already voted!"
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    if @question.votes.last && @question.votes.last.user_id == current_user.id
      @question.votes.last.destroy
      redirect_to questions_path
    else
      redirect_to questions_path, alert: 'No votes to delete'
    end
  end

  private
  def load_votable
    resource, @id = request.path.split('/')[1,2]
    @votable = resource.singularize.classify.constantize.find(@id)
  end
end
