class WordsController < ApplicationController   
  def index	
    if params[:category] || params[:status]
      @words = Word.search params[:category], params[:status], current_user.id
    else 
      @words = Word.all
    end
  end

  def show  
    @word = Word.find params[:id]
  end
end
