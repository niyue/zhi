json.array!(@exams) do |exam|
  json.extract! exam, :id, :name, :description
  json.url exam_url(exam, format: :json)
end
