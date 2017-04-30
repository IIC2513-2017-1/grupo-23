class Team < ApplicationRecord
  has_attached_file :shield, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :shield, content_type: /\Aimage\/.*\z/
  validates :name, presence: true, uniqueness: true,
   length: { minimum: 3, maximum: 20 }, allow_blank: false
end
