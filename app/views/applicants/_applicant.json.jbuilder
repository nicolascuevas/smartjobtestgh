json.extract! applicant, :id, :email, :first_name, :last_name, :token, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
