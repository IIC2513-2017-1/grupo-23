class User < ApplicationRecord
  validates :password, presence: true, length: { minimum: 6 },
                       confirmation: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i


                    belongs_to :team, optional:true
                     has_many :user_invitations
                     has_many :tournaments
                     has_many :publication
                     has_many :comments
                     has_and_belongs_to_many :matchs
end
