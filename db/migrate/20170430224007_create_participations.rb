
class AddTeamToParticipation < ActiveRecord::Migration[5.0]
  def change
    add_reference :participations, :team, foreign_key: true
  end
end
class AddParticipationToMatch < ActiveRecord::Migration[5.0]
  def change
    add_reference :matchs, :participation, foreign_key: true
  end
end
class AddUserToTeam < ActiveRecord::Migration[5.0]
  def change
    add_reference :teams, :user, foreign_key: true
  end
end
class AddUserToTournament < ActiveRecord::Migration[5.0]
  def change
    add_reference :tournaments, :user, foreign_key: true
  end
end
class AddUserToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :user, foreign_key: true
  end
end
class AddPublicationToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :publications, :user, foreign_key: true
  end
end
class AddUserToUser_invitation < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_invitations, :user, foreign_key: true
  end
end
class AddUserToPublication < ActiveRecord::Migration[5.0]
  def change
    add_reference :publications, :user, foreign_key: true
  end
end
class AddTeamToUser_invitation < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_invitations, :team, foreign_key: true
  end
end
class AddTeamToTournament_invitation < ActiveRecord::Migration[5.0]
  def change
    add_reference :tournament_invitations, :team, foreign_key: true
  end
end
class AddTeam_invitationToTournament < ActiveRecord::Migration[5.0]
  def change
    add_reference :tournaments, :team_invitation, foreign_key: true
  end
end
class AddMatchToTournament < ActiveRecord::Migration[5.0]
  def change
    add_reference :tournaments, :match, foreign_key: true
  end
end
class CreateUser < ActiveRecord::Migration[5.0]
    def change

      create_table :match_users, id: false do |t|
        t.belongs_to :user, index: true
        t.belongs_to :match, index: true
      end
  end
end
class CreateTournament < ActiveRecord::Migration[5.0]
    def change
      create_table :tournament_teams, id: false do |t|
        t.belongs_to :tournament, index: true
        t.belongs_to :match, index: true
      end
  end
end
