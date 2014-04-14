json.array!(@retailers) do |retailer|
  json.extract! retailer, :id, :name, :address, :contact
  json.url retailer_url(retailer, format: :json)
end
