json.extract! user, :id, :name, :age, :fitness_activity, :has_insurance, :insurance_type, :created_at, :updated_at
json.url user_url(user, format: :json)
