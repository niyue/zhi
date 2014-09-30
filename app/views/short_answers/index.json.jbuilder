json.array!(@short_answers) do |short_answer|
  json.extract! short_answer, :id, :name, :description, :answer
  json.url short_answer_url(short_answer, format: :json)
end
