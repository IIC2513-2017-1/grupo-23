class Comment < ApplicationRecord
  validates :content, presence: true, length: { minimum: 1, maximum: 50 },
   allow_blank: false
end
