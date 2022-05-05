10.times do |n|
  title = "タスク#{n}"
  content = "タスクの内容#{n}"

  Task.create!(
    title: title,
    content: content
  )
end