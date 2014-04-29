class Word < ActiveRecord::Base
  belongs_to :category
  has_many :options
  has_many :lession_words
  has_many :lessions, through: :lession_words
  
  scope :search, ->(category, status) do 
    if(!status.nil? && !category.nil?)
      {:conditions => ['category_id = ? AND status = ?', category, status]}
    else
      {:conditions => ['category_id = ? OR status = ?', category, status]}
    end 
  end
    
  scope :generate_random_words, ->(category_id) do
    where(category_id: category_id).order("RANDOM()").limit(5)  
  end  
end 

