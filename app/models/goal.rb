class Goal < ApplicationRecord
  belongs_to :character
  has_one :character

end
