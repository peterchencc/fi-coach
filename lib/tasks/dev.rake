namespace :dev do
  task :fake => :environment do
    puts "Fake data..."

    User.delete_all
    Coach.delete_all
    Skill.delete_all

    users = []
    skills = ["Swim", "Fit", "Golf", "Running", "Weighting"]
    skills.each do |s|
      puts s
      Skill.create( :name => s )
    end
    emails = ["example@gmail.com", "ihower@gmail.com", "frozenfung@gmail.com", "vneverz@gmail.com", "tim.du@alphacamp.co"]
    emails.each do |email|
      puts email
      user = User.create( :email => email, :password => "12345678", :image => Faker::Avatar.image)
      user.create_coach(
          :coach_name => Faker::Name.name,
          :contact_email => Faker::Internet.email,
          :contact_phone => Faker::PhoneNumber.phone_number,
          :info => "XXXX體適能協會合格教官 , ABC健身俱樂部體適能教練, (寫過的文章、部落格LINK)",
          :description => Faker::Lorem.paragraph,
          :certificate => "職業證照",
          :teaching_frame => "「樂在學習，關心他人」。希望學生可以在學習中快樂的學習知識，懂得關心他人，對別人好。最終目的是懂得關心他人，學好「做人處世」。"
        )
    end
  end

end