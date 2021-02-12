json.extract! question, :id, :name, :value, :correct_answer, :type, :inputType, :quiz_id, :quiz_page_id, :created_at, :updated_at
json.url question_url(question, format: :json)
