# User.create!(email: "sp@gmail.com", password: "hellohello", password_confirmation: "hellohello")

30.times do
  Course.create! ([{
    title: Faker::Educator.course_name,
    short_description: Faker::Movies::VForVendetta.quote,
    language: ["English", "Italian", "Spanish", "Polish", "French"].sample,
    price: rand(15..100),
    level: ["Beginner", "Intermediate", "Advanced"].sample,
    description: Faker::Quote.famous_last_words,
    user_id: User.first.id
  }])
end