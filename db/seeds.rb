include FactoryBot::Syntax::Methods

request = create(:request)

# Valid partners within range
p1 = create(:partner, lng: request.lng, lat: request.lat, operating_radius: 100_000, rating: 1)
p2 = create(:partner, lng: request.lng, lat: request.lat, operating_radius: 100_000, rating: 5)

# Slightly futher away, but still within range
p3 = create(:partner, lng: request.lng + 0.01, lat: request.lat, operating_radius: 100_000, rating: 5)

# Outside of operating radius
p4 = create(:partner, lng: request.lng * 2, lat: request.lat * 2, operating_radius: 100_000)

[p1, p2, p3, p4].each do |partner|
  request.materials.each do |material|
    create(:experience, partner: partner, material: material)
  end
end

# Missing materials, but within range
create(:partner, lng: request.lng, lat: request.lat, operating_radius: 100_000)

puts "Done! Navigate to http://localhost:3000/requests/#{request.id}/partners to see the results"
