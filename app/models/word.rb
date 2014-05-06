class Word < ActiveRecord::Base
  belongs_to :category
  has_many :options
  accepts_nested_attributes_for :options, allow_destroy: true, reject_if: :all_blank
  has_many :lession_words
  has_many :lessions, through: :lession_words
  validates :character, presence: true
  validates :meaning, presence: true
  validates :category_id, presence: true

  scope :search, ->(category, status, user_id) do 
    if(!status.nil? && !category.nil?)     
      word_ids = "SELECT DISTINCT word_id FROM answers
                  WHERE category_id = #{category} AND user_id = #{user_id}"
      if(status == "1")
        where("id IN (#{word_ids})")
      else 
        where("id NOT IN (#{word_ids})")
      end 
    else
      where(category_id: category)
    end
  end
    
  scope :generate_random_words, ->(category_id) do
    where(category_id: category_id).order("RANDOM()").limit(5)  
  end  
end 

