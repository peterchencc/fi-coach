json.array!(@admin_coaches) do |admin_coach|
  json.extract! admin_coach, :id, :coach_name
  json.url admin_coach_url(admin_coach, format: :json)
end
