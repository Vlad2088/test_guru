class AnswersController < ApplicationController
  
  before_action :set_answer

  def show; end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answers_params
    params.require(:answer).permit(:body, :correct)
  end

end
