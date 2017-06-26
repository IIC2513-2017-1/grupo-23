json.team do
  json.href api_v1_team_url(@team)+".json"
  json.name @team.name
  json.dueno @team.dueno.full_name
  json.jugadores @team.users.select(:name,:lastname, :email).where(juega:1)
  json.hinchas @team.users.select(:name,:lastname, :email).where(juega:0)
end