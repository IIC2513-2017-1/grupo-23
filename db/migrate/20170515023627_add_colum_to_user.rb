class AddColumToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :jugador, :integer
    add_column :users, :juega, :integer
  end
end
