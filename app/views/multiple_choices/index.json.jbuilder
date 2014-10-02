json.array!(@multiple_choices) do |multiple_choice|
  json.extract! multiple_choice, :id, :description
  json.url multiple_choice_url(multiple_choice, format: :json)
end
