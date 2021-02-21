User.create!(email: "sp@gmail.com", password: "hellohello", password_confirmation: "hellohello")

30.times do
  Course.create! ([{
    title: Faker::Educator.course_name,
    description: Faker::Quote.famous_last_words,
    user_id: User.first.id
  }])
end