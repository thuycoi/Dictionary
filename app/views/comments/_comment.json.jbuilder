json.extract! comment, :id, :commenter, :body, :gword_id_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)