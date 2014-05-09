class LessionsController < ApplicationController
  before_action :signed_in_user, only: [:new, :show]
  def index
    @lessions = Lession.all
  end

  def show
    @lession = Lession.find params[:id]
    @learned_words_num = 0  
    answers_num = @lession.answers.count unless @lession.nil?
    if(answers_num >= 5)
      @answers = @lession.answers
    else
      @words = @lession.words.not_learned_words @lession.id, current_user.id
      @learned_words_num = @lession.words.count - @words.count
      @answer = Answer.new
    end
  end
 
  def new
    category = Category.find params[:category_id]          
    @lession = Lession.new(user_id: current_user.id, 
                         category_id: category.id, name: category.name)
    if @lession.save
      @lession.update_attributes name: @lession.name << "_" << @lession.id.to_s
      Activity.create(content: "Start Lession " << @lession.name, lession_id: @lession.id)
      words = Word.generate_random_words category.id
      words.each{|word| LessionWord.create(lession_id:@lession.id, word_id:word.id)}
    end
    redirect_to lession_path(@lession)
  end
end
