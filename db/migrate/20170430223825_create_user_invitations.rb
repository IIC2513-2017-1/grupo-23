class CreateUserInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_invitations do |t|
      t.string :texto

      t.timestamps
    end
  end
end
