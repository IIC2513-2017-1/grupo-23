class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :group
      t.integer :dueno_id
      t.timestamps
    end
    add_index :teams, :name, unique: true
  end
end
