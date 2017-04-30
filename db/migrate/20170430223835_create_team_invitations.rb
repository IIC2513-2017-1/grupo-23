class CreateTeamInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :team_invitations do |t|
      t.string :texto

      t.timestamps
    end
  end
end
