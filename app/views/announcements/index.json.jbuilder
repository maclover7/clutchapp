json.array!(@announcements) do |announcement|
  json.extract! announcement, :id, :name, :body
  json.url announcement_url(announcement, format: :json)
end
