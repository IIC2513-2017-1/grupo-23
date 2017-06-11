class Match < ApplicationRecord
  validates :date, presence: true, allow_blank: false


 has_many :goals
 has_many :users, through: :goals
 belongs_to :tournament
 belongs_to :local, :class_name => 'Team', :foreign_key => 'local_id'
 belongs_to :visitor, :class_name => 'Team', :foreign_key => 'visitor_id'
 def gana
  @x = "Empate"
  gvisitnates = 0
  glocales = 0
  Goal.where(match_id:id).each do |g|
    
    if  visitor.user_ids.include?(g.user_id)
      gvisitnates += g.cantidad
    else
      glocales += g.cantidad
    end
    if gvisitnates > glocales
      @x= visitor.name
    elsif glocales > gvisitnates
      @x= local.name
    else
      @x = "Empate"
    end
    
   end
   return @x
 end


end
