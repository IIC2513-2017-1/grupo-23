class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :date, null: false
      t.string :result
      t.timestamps
    end
  end
end
