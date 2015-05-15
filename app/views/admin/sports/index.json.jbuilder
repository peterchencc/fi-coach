json.array!(@admin_sports) do |admin_sport|
  json.extract! admin_sport, :id, :name
  json.url admin_sport_url(admin_sport, format: :json)
end
