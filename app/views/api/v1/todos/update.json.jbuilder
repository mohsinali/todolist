json.success true
json.msg 'Your todo item was udpated successfully.'

json.data do 
  json.partial! 'todo', todo: @todo
end