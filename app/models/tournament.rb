class Tournament < ApplicationRecord
  validates :name, presence: true, uniqueness: true,
   length: { minimum: 1, maximum: 20 }, allow_blank: false

   belongs_to :user
 has_many :tournament_invitations
 has_and_belongs_to_many :teams
 has_many :match
end
