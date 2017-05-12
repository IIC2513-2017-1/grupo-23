class AddColumnToParticipate < ActiveRecord::Migration[5.0]
  def change
    add_reference :participates, :tournament, foreign_key: true
    add_reference :participates, :match, foreign_key: true
  end
end
