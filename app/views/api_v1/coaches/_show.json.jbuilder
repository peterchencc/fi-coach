json.url v1_coach_url(c)
json.post_comment_url v1_coach_url(c)+"/comments"
json.user_id c.user_id
json.coach_id c.id
json.coach_name c.coach_name
json.description c.description
json.teaching_frame c.teaching_frame
json.contact_email c.contact_email
json.contact_phone c.contact_phone
json.status c.status
json.sex c.sex
json.created_at c.created_at
json.updated_at c.updated_at
json.rating c.rating

json.sports_all c.sports.all.map{|e| e[:name]}.join(" ")
json.sports c.sports do |sport|
  json.id sport.id
  json.name sport.name
end

json.experiences_all c.experiences.all.map{|e| e[:name]}.join(" ")
json.experiences c.experiences do |experience|
  json.name experience.name
end

json.certificates_all c.certificates.all.map{|e| e[:name]}.join(" ")
json.certificates c.certificates do |certificate|
  json.name certificate.name
end

json.skills_all c.skills.all.map{|e| e[:name]}.join(" ")
json.skills c.skills do |skill|
  json.name skill.name
end

if c.cities.first
  json.city_first c.cities.first.name
end

json.cities_all c.cities.all.map{|e| e[:name]}.join(" ")
json.cities c.cities do |city|
  json.name city.name
end


json.image_original_url asset_url(c.photo.url)
json.image_medium_url asset_url(c.photo.url(:medium))
json.image_thumb_url asset_url(c.photo.url(:thumb))
json.image_file_name c.photo_file_name
json.image_content_type c.photo_content_type
json.image_file_size c.photo_file_size
json.image_updated_at c.photo_updated_at

if c.lessons.first
  json.lesson_first_min_price c.lessons.first.min_price
else
  json.lesson_first_min_price 0
end

json.lessons c.lessons do |lesson|
  json.name lesson.name
  json.content lesson.content
  json.suitable lesson.suitable
  json.min_price lesson.min_price
  json.max_price lesson.max_price
  json.attendance lesson.attendance
  json.ps lesson.ps
  json.image_original_url asset_url(lesson.photo.url)
  json.image_medium_url asset_url(lesson.photo.url(:medium))
  json.image_thumb_url asset_url(lesson.photo.url(:thumb))
  json.image_file_name lesson.photo_file_name
  json.image_content_type lesson.photo_content_type
  json.image_file_size lesson.photo_file_size
  json.image_updated_at lesson.photo_updated_at
end

json.comments c.comments do |comment|
  json.comment_id comment.id
  json.comment_content comment.content
  json.comment_rating comment.rating
  json.comment_content comment.content
  json.user_id comment.user_id
  json.user_name comment.user.display_name
  json.user_image comment.user.display_avatar
  json.updated_at_only_date comment.updated_at.to_date
  json.updated_at comment.updated_at
end

