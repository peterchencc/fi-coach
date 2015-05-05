json.data 5.times do |i|
  json.partial! "show", :locals => { :@i => i+1 }
end