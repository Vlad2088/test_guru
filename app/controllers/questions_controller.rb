class QuestionsController < ApplicationController
  before_action :choice_of_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    questions = @test.questions.map { |question| question.body }
    render plain: questions.join("\n")
  end

  def show
    question = @test.questions.find(params[:id]) 
    render plain: question.body
  end

  def new

  end

  def create
    question = @test.questions.build(question_params)
    
    if question.save
      redirect_to test_questions_path(@test)
    else
      render plain: 'Question not create!'
    end
  end

  def destroy
    question = @test.questions.find(params[:id]) 
    question.destroy
    redirect_to test_questions_path(@test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def choice_of_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
