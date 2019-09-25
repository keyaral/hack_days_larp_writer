class Character < ApplicationRecord
  belongs_to :larp
  has_many :goal
  has_many :items

end
