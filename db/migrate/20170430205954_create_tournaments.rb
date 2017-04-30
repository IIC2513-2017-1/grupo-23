class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :tournaments, :name, unique: true
  end
end
