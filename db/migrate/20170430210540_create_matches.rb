class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :date, null: false
      t.string :result
      t.integer :visitor_id
      t.integer :local_id
      t.timestamps
    end

  end
end
