json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :name, :prompt, :work_allowed
  json.url assignment_url(assignment, format: :json)
end
