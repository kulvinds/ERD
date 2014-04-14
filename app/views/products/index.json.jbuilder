json.array!(@products) do |product|
  json.extract! product, :id, :manufacturer, :model_number, :price, :description, :retailer_id
  json.url product_url(product, format: :json)
end
