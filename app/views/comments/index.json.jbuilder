json.array!(@comments) do |comment|
  json.extract! comment, :id, :review_id, :body, :user_id
  json.url comment_url(comment, format: :json)
end
