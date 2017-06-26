
 json.array! @publications do |publication|
    json.href api_v1_user_url(publication.user)
    json.content publication.content
    json.user publication.user.full_name
 end