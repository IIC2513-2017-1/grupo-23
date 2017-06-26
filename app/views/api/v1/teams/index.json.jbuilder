
 json.array! @teams do |team|
    json.href api_v1_team_url(team)
    json.name team.name
    json.dueno team.dueno.full_name
 end