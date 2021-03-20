if User.find_by_email("admin@example.com").nil?
  admin = User.create!(email: "admin@example.com", password: "admin@example.com", password_confirmation: "admin@example.com")
  # admin.skip_confirmation!
  admin.add_role(:admin) unless admin.has_role?(:admin)
  admin.add_role(:teacher) unless admin.has_role?(:teacher)
end

# Enrollment.create(user_id: 298, course_id: 56, price: 0)

if User.find_by_email("studentteacher@example.com").nil?
  studentteacher = User.create!(email: "studentteacher@example.com", password: "studentteacher@example.com", password_confirmation: "studentteacher@example.com")
  # studentteacher.skip_confirmation!
  studentteacher.add_role(:teacher) unless studentteacher.has_role?(:teacher)
  studentteacher.add_role(:student) unless studentteacher.has_role?(:student)
end

if User.find_by_email("student@example.com").nil?
  student = User.create!(email: "student@example.com", password: "student@example.com", password_confirmation: "student@example.com")
  # student.skip_confirmation!
  student.add_role(:student) unless student.has_role?(:student)
end

PublicActivity.enabled = false

5.times do
  Course.create!([{
    title: Faker::Educator.course_name,
    short_description: Faker::Quote.famous_last_words,
    description: Faker::TvShows::GameOfThrones.quote,
    user: User.find_by(email: "admin@example.com"),
    language: "English",
    level: "Advanced",
    # price: Faker::Number.between(from: 1000, to: 20000),
    price: 0
  }])
end

5.times do
  Course.create!([{
    title: Faker::Educator.course_name,
    short_description: Faker::Quote.famous_last_words,
    description: Faker::TvShows::GameOfThrones.quote,
    user: User.find_by(email: "studentteacher@example.com"),
    language: Faker::ProgrammingLanguage.name,
    level: "Beginner",
    # price: Faker::Number.between(from: 1000, to: 20000),
    price: 0
  }])
end
