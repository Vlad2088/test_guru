class FeedbackController < ApplicationController

  def new; end

  def create
    FeedbackMailer.feedback(params[:email], params[:name], params[:message]).deliver_now
    redirect_to root_path, notice: t('.success_feedback')
  end
end
