json.href api_v1_tournament_url(@tournament)
json.name @tournament.name
json.matches @tournament.matches.select(:date, :local_id, :visitor_id, :id).to_a.collect{|x| {:date => x.date, :local_id => Team.find(x.local_id).name, :visitor_id => Team.find(x.visitor_id).name, :id => x.id, :url => api_v1_match_url(Match.find(x.id))}}