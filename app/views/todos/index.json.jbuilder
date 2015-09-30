json.array!(@todos) do |todo|
  json.extract! todo, :id, :task, :status, :priority
  json.url todo_url(todo, format: :json)
end
