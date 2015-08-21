json.array!(@users) do |user|
  json.extract! user, :id, :FName, :LName, :Gender, :Birthdate, :Email, :Password, :Bio
  json.url user_url(user, format: :json)
end
