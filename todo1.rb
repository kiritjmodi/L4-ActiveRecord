require 'active_record'

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def to_displayable_string
    display_status = completed ? "[x]" : "[ ]"
    display_date = due_today? ? nil : @due_date
    "#{display_status} #{todo_text} #{display_date}"
  end

  def self.to_displayable_list
    all.map {|todo| todo.to_displayable_string }
  end

  def self.show_list
    puts "My Todo-list\n\n"

    puts "Overdue"
    # FILL IN HERE
    puts "\n\n"

    puts "Due Today"
    # FILL IN HERE
    puts "\n\n"

    puts "Due Later"
    # FILL IN HERE
  end

  def self.add_task(todo)
    Todo.create!(todo_text:todo[:todo_text],due_date:(Date.today+ todo[:due_in_days]),completed:false)
  end
  def self.mark_as_complete(todo_id)
   todo=Todo.find(todo_id)
   todo.completed=true
   todo.save
   todo
  end
end
