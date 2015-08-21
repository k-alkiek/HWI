json.array!(@comments) do |comment|
  json.extract! comment, :id, :User_id, :reviews_id, :body
  json.url comment_url(comment, format: :json)
end
