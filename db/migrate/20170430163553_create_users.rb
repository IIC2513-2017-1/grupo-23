class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :lastname, null: false
      t.string :email , null: false
      t.string :password, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
    create_table :matches_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :match, index: true
    end
  end
end
