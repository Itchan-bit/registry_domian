json.extract! registrant, :id, :voice, :fax, :email, :created_at, :updated_at
json.url registrant_url(registrant, format: :json)
