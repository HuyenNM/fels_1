class AnswersController < ApplicationController
  after_action :set_lession_status 

  def create
    @answer = Answer.new answer_params
    @answer.save    
    render nothing: true
  end

  def answer_params
    params.require(:answer).permit(:category_id, :option_id, :user_id, :lession_id, :word_id)
  end

  def set_lession_status
    lession = Lession.find params[:lession_id]
    answers_num = lession.answers.count unless lession.nil?
    correct_num = 0
    lession.answers.each{|answer| 
      option = Option.find answer.option_id
      if option.is_correct
        correct_num += 1
      end
    }
    if(answers_num >= 5)
      Activity.create(content: "Finish Lession " + lession.name + 
           " with "  + correct_num.to_s + " / " + answers_num.to_s + " corrects", 
           lession_id: lession.id)
    end
  end
end
