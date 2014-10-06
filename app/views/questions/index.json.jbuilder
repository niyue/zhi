json.array!(@questions) do |question|
  json.extract! question, :id, :exam_id, :question_id, :question_type, :position
  json.url question_url(question, format: :json)
end
