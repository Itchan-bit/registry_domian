json.extract! registrant, :id, :first_name, :last_name, :contact, :address, :created_at, :updated_at
json.url registrant_url(registrant, format: :json)
