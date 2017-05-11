class CreateParticipates < ActiveRecord::Migration[5.0]
  def change
    create_table :participates do |t|

      t.timestamps
    end
  end
end
