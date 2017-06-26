class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, allow_blank: false,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i


  belongs_to :team, optional:true
  has_many :user_invitations
  has_many :tournaments
  has_many :publications
  has_many :comments
  has_many :goals
  has_many :maches, through: :goals
  has_many :maches, through: :tournaments


  def full_name
    "#{name} #{lastname}"
  end
  def generate_token_and_save
    loop do
      self.token = SecureRandom.hex(64)
      break if save
    end
  end
end
