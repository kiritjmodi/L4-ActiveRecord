require 'active_record'

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def to_displayable_string
    display_status = completed ? "[x]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{display_status} #{todo_text} #{display_date}"
  end

  def self.to_displayable_list
    all.map {|todo| todo.to_displayable_string }
  end


  def self.overdue
   where ("due_date < ?", Date.today)
  end
  def self.due_today
    where ("due_date = ?", Date.today)
  end
  def self.due_later
   where ("due_date > ?", Date.today)
  end

  def self.show_list
    puts "My Todo-list\n\n"

    puts "Overdue"
    puts overdue.map { |todo| todo.to_displayable_string }
    # FILL IN HERE
    puts "\n\n"

    puts "Due Today"
   puts due_today.map{|todo| todo.to_displayable_string}
    # FILL IN HERE
    puts "\n\n"

    puts "Due Later"
   puts due_later.map{|todo| todo.to_displayable_string}
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
