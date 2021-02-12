json.extract! quiz, :id, :name, :description, :quiz_data, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
