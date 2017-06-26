json.href api_v1_match_url(@match)
json.goles_visita @match.goals.where("user_id in (?)", @match.visitor.user_ids).select(:cantidad, :user_id).to_a.collect{|x| {:cantidad => x.cantidad, :jugador => User.find(x.user_id).full_name}}
json.goles_locales @match.goals.where("user_id in (?)", @match.local.user_ids).select(:cantidad, :user_id).to_a.collect{|x| {:cantidad => x.cantidad, :jugador => User.find(x.user_id).full_name}}
