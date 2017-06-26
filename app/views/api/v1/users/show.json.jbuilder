json.user do
  json.href api_v1_user_url(@user)+".json"
  json.name @user.full_name
  json.email @user.email
  json.team @user.team.name
  json.publications @user.publications.select(:content, :id, :created_at)
end