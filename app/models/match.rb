class Match < ApplicationRecord
  validates :date, presence: true, allow_blank: false
  validates :visitor, presence: true, allow_blank: false
  validates :local, presence: true, allow_blank: false
end
