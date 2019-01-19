json.success true
json.msg 'Your todo list'

json.data do
  json.array! @todos do |todo|
    json.partial! 'todo', todo: todo
  end
end