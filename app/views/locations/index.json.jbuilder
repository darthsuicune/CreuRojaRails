json.array!(@locations) do |location|
  json.extract! location, :id, :name, :description, :address, :phone, :latitude, :longitude, :location_type, :active
  json.url location_url(location, format: :json)
end
