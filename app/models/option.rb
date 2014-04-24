class Option < ActiveRecord::Base
  belongs_to :word

  scope :correct_option, -> do 
    where(is_correct: "true")
  end
end 