class Comment < ApplicationRecord
  validates :content, presence: true, length: { minimum: 1, maximum: 50 },
   allow_blank: false

  belongs_to :user
  belongs_to :publication
end