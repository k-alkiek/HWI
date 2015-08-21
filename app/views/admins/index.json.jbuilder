json.array!(@admins) do |admin|
  json.extract! admin, :id, :Username, :Password
  json.url admin_url(admin, format: :json)
end
