json.extract! quiz_page, :id, :title, :quiz_id, :created_at, :updated_at
json.url quiz_page_url(quiz_page, format: :json)
