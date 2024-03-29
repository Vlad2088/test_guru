class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    flash[:notice] = t('.time_over') if @test_passage.time_over?

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      BadgeService.new(@test_passage).call
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
