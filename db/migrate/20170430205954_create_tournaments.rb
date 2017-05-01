class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false

      t.timestamps

    end
    create_table :tournaments_teams, id: false do |t|
      t.belongs_to :tournament, index: true
      t.belongs_to :match, index: true
    end
    add_index :tournaments, :name, unique: true
  end
end
