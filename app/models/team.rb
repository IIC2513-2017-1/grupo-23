class Team < ApplicationRecord
  has_attached_file :shield, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://www.opensourcealternative.org/wp-content/uploads/2014/03/shield-730x430.png"
  validates_attachment_content_type :shield, content_type: /\Aimage\/.*\z/
  validates :name, presence: true, uniqueness: true,
   length: { minimum: 3, maximum: 20 }, allow_blank: false

 has_many :users
 has_many :user_invitations
 has_many :tournament_invitations
 has_and_belongs_to_many :matches
 has_many :participates
 has_many :tournaments, through: :participates
 belongs_to :dueno, :class_name => 'User', :foreign_key => 'dueno_id'


end
