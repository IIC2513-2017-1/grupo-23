class Match < ApplicationRecord
  validates :date, presence: true, allow_blank: false

<<<<<<< HEAD
 has_and_belongs_to_many :users
 belongs_to :tournament
 has_one :local, :class_name => 'Team', :foreign_key => 'local_id'
 has_one :visitor, :class_name => 'Team', :foreign_key => 'visitor_id'
=======
  has_and_belongs_to_many :users
  belongs_to :tournament
  has_one :local, class: "Team", foreign_key: "local_id"
  has_one :visitor, class: "Team", foreign_key: "visitor_id"
>>>>>>> origin/navbar

end
