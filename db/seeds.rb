User.create!(
  name: 'Example User',
  email: 'example@railstutorial.org',
  password_digest: 'foobar',
  
  admin: '管理者'
)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@rails.org"
  password_digest = 'password'
  User.create!(
    name: name,
    email: email,
    password_digest: password_digest,
    admin: 'ユーザー'
  )
end

10.times do |n|
  title = "タスク#{n}"
  content = "タスクの内容#{n}"
  expired_at = Faker::Date.in_date_period
  status = rand(0..2)
  user_id = rand(1..10)
  Task.create!(
    title: title,
    content: content,
    expired_at: expired_at,
    status: status,
    user_id: user_id
  )
end