class QuestionsController < ApplicationController
  before_action :find_question, except: [:new, :create, :index]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @questions = Question.all
  end

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
    @tag = Tag.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path, notice: "Question saved!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if  @question.update(question_params)
      redirect_to questions_path, notice: "Question updated!"
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :user_id, tag_ids: [])
  end
end
