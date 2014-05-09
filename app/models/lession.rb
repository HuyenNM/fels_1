class Lession < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :lession_words
  has_many :words, through: :lession_words
  has_many :activities , dependent: :destroy
end
