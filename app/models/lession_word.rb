class LessionWord < ActiveRecord::Base
  belongs_to :lession
  belongs_to :word
end
