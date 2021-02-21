30.times do
  Course.create! ([{
    title: Faker::Educator.course_name,
    description: Faker::Quote.famous_last_words
  }])
end