json.extract! product, :id, :title, :details, :product_type, :price, :stock, :created_at, :updated_at
json.url product_url(product, format: :json)
