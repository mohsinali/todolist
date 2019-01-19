json.success true
json.msg 'Todo details'

json.data do  
  json.partial! 'todo', todo: @todo
end