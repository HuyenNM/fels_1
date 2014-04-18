class Word < ActiveRecord::Base
  belongs_to :category

  scope :search, ->(category, status) do 
    if(!status.nil? && !category.nil?)
      {:conditions => ['categoryID = ? AND status = ?', category, status]}
    else
      {:conditions => ['categoryID = ? OR status = ?', category, status]}
    end 
  end
end 

