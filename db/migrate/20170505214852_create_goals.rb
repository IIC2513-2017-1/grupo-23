class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :cantidad
      t.timestamps
    end
  end
end
