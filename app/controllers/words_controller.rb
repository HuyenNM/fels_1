require 'csv'
class WordsController < ApplicationController   
  def index
    if params[:category] || params[:status]
      @words = Word.search params[:category], params[:status], current_user.id
    else 
      @words = Word.all
    end
    respond_to do |format|
      format.html
      format.csv {
        unless @words.nil? 
          csv_string = CSV.generate do |csv|
            csv << ["character", "meaning","category_id","created_at"]             
            @words.each do |word| 
              csv << [word.character, word.meaning, word.category_id, word.created_at] 
            end
          end
          render text: csv_string
        end
      }
    end 
  end

  def show  
    @word = Word.find params[:id]
  end
end
