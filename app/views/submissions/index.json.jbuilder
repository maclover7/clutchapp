json.array!(@submissions) do |submission|
  json.extract! submission, :id, :title, :body, :submitted, :assignment_id, :user_id
  json.url submission_url(submission, format: :json)
end
