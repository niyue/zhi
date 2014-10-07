json.array!(@parts) do |part|
  json.extract! part, :id, :exam_id, :question_id, :question_type, :position
  json.url part_url(part, format: :json)
end
