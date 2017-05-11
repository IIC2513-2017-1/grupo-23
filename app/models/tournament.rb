class Tournament < ApplicationRecord
  validates :name, presence: true, uniqueness: true,
   length: { minimum: 1, maximum: 20 }, allow_blank: false

   belongs_to :user
 has_many :tournament_invitations
  has_many :participates
 has_many :teams, through: :participates
 has_many :matches
end
