json.extract! customer, :id, :name, :last_name, :address, :mail, :phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)
