class AnswersController < ApplicationController
  before_action :find_answer, except: [:new, :create, :index]

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:answer][:question_id])
    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @question = Question.find(params[:answer][:question_id])
    @answer.update(answer_params)
    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer.destroy
    redirect_to question_path(@question)
  end


private
  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:response, :question_id)
  end
end
