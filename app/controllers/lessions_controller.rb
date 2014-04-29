class LessionsController < ApplicationController
  def show 
    @lession = Lession.find params[:id]    
    @words = @lession.words unless @lession.nil?
    @answer = Answer.new
  end
 
  def new
    category = Category.find params[:category_id]          
    @lession = Lession.new(user_id: current_user.id, 
                         category_id: category.id, name: category.name)
    if @lession.save
      words = Word.generate_random_words category.id
      words.each{|word| LessionWord.create(lession_id:@lession.id, word_id:word.id)}
    end
    redirect_to lession_path(@lession)
  end  
end
