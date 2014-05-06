class  Admin::WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  def index  
    @words = Word.paginate page: params[:page], per_page: 5
  end

  def show
  end

  def new
    @word = Word.new
    4.times { @word.options.build }
  end

  def edit
  end

  def create
    @word = Word.new word_params
    if @word.save
      redirect_to admin_word_path(@word), notice: 'Word was successfully created.'        
    else
      render action: 'new' 
    end
  end

  def update
    if @word.update_attributes(word_params)
      redirect_to admin_word_path(@word), notice: 'Word was successfully updated.' 
    else
      render action: 'edit' 
    end
  end

  def destroy
    @word.destroy
    redirect_to admin_words_path 
  end

  private
    def set_word
      @word = Word.find params[:id]
    end

    def word_params
      params.require(:word).permit(:character, :meaning, :category_id, 
            options_attributes: [:id, :word_id, :text, :is_correct, :_destroy])
    end
end
