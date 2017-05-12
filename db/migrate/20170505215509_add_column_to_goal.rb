class AddColumnToGoal < ActiveRecord::Migration[5.0]
  def change
    add_reference :goals, :user, foreign_key: true
    add_reference :goals, :match, foreign_key: true
    
    
  end
end
