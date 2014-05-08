class AnswersController < ApplicationController
  def create      
    @answer = Answer.new answer_params
    @answer.save
    render nothing: true
  end
  def answer_params
    params.require(:answer).permit(:category_id, :option_id, :user_id, :lession_id, :word_id)
  end
end
