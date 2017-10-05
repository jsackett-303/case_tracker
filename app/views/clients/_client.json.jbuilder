json.extract! client, :id, :case_id, :last_name, :first_name, :middle_name, :address, :city, :state, :postal_code, :notes, :created_at, :updated_at
json.url client_url(client, format: :json)
