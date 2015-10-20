class DownVotesController < ApplicationController
  before_action :load_votable

  def new
    @down_vote = @downable.down_votes.new
  end

  def create

    if params[:answer_id]
      @downable = Answer.find(params[:answer_id])
      @down_vote = @downable.down_votes.new
    else
      @down_vote = @downable.down_votes.new
    end
      @down_vote.user_id = current_user.id

    begin
      if @down_vote.save
        redirect_to question_path(@id)
      end
    rescue ActiveRecord::RecordNotUnique
      redirect_to question_path(@id)
      flash[:alert] = "You have already voted!"
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    if @question.down_votes.last && @question.down_votes.last.user_id == current_user.id
      @question.down_votes.last.destroy
      redirect_to questions_path
    else
      redirect_to questions_path, alert: 'No votes to delete'
    end
  end

  private
  def load_votable
    resource, @id = request.path.split('/')[1,2]
    @downable = resource.singularize.classify.constantize.find(@id)
  end
end
