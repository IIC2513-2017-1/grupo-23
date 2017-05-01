class Publication < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :content, presence: true, length: { minimum: 6, maximum: 500 },
   allow_blank: false

  belongs_to :user
  has_many :comments
end
