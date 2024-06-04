json.extract! pizza_part, :id, :name, :description, :price, :category, :created_at, :updated_at
json.url pizza_part_url(pizza_part, format: :json)
