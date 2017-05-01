class CreateTournamentInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :tournament_invitations do |t|
      t.string :texto

      t.timestamps
    end
    add_reference :publications, :user, foreign_key: true
    add_reference :comments, :publication, foreign_key: true
    add_reference :user_invitations, :user, foreign_key: true
    add_reference :comments, :user, foreign_key: true
    add_reference :user_invitations, :team, foreign_key: true
    add_reference :tournament_invitations, :team, foreign_key: true
    add_reference :tournament_invitations, :tournament, foreign_key: true
    add_reference :matches, :tournament, foreign_key: true
    add_reference :tournaments, :user, foreign_key: true
    add_reference :users, :team, foreign_key: true
  end
end
