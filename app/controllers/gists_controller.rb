class GistsController < ApplicationController

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    @result = GistQuesnionServise.new(@test_passage.current_question).call

    if @result.success = true
      @test_passage.current_question.gist.create!(user: current_user, url: @result.url)
      flash[:notice] = "#{t('.succes')} - #{ActionController::Base.helpers.link_to(t('.result'), @result.url, target: '_blank')}"
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

end
