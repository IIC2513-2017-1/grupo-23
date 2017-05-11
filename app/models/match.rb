class Match < ApplicationRecord
  validates :date, presence: true, allow_blank: false


 has_many :goals
 has_many :users, through: :goals
 belongs_to :tournament
 belongs_to :local, :class_name => 'Team', :foreign_key => 'local_id'
 belongs_to :visitor, :class_name => 'Team', :foreign_key => 'visitor_id'


end
