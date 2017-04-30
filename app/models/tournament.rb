class Tournament < ApplicationRecord
  validates :name, presence: true, uniqueness: true,
   length: { minimum: 1, maximum: 20 }, allow_blank: false
end
