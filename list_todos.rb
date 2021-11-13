require "./connect_db1.rb"
require "./todo1.rb"

connect_db!
Todo.show_list
