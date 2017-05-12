class AddColumnToParticipate < ActiveRecord::Migration[5.0]
  def change
    add_column :participates, :tournament_id, :integer
    add_column :participates, :match_id, :integer
  end
end
