class Publication < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png", dependent: :destroy
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :content, presence: true, length: { minimum: 6, maximum: 500 },
   allow_blank: false

  belongs_to :user
  has_many :comments, dependent: :destroy


  scope :restricted_for, (lambda { |user|
    where(private: false) unless user
  })

# Cuando se tengan relaciones de seguir/seguido
#  scope :followed_by, (lambda { |user|
#    where(user: user.following) if user
#  })

end
