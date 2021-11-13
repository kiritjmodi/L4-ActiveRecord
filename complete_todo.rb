require "./connect_db1.rb"
require "./todo1.rb"

connect_db!
Todo.show_list

puts "Which todo do you want to mark as complete? (Enter id): "
todo_id = gets.strip.to_i

todo = Todo.mark_as_complete(todo_id)

puts todo.to_displayable_string
