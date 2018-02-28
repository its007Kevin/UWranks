class FeedbacksController < ApplicationController
  def new
  end
 
  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.save
    flash[:notice] = "Thanks for your feedback."
    redirect_to new_feedback_path
  end
  
  private
    def feedback_params
      params.require(:feedback).permit(:body)
    end
end
