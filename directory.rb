@students = []
#first we print the list of students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "MAIN MENU:"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to files"
  puts "4. Load a list from files"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students(filename = "students.csv")
  #ask user for filename
  puts "Please enter the filename"
  filename = gets.chomp
  #open the file for writing
  file = File.open(filename, "w")
  #iterate over the array of save_students
  @students.each do |student|
    student_data = student[:name], student[:cohort]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "File saved as #{filename}"
end

def load_students(filename = "students.csv")
  puts "Please enter a filename"
  filename = gets.chomp
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def startup_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #if a filename is not given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} students from  #{filename}"
  else #if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit #this will cause the program to terminate
  when "3"
    save_students
  when "4"
    load_students
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count == 1
    puts "Overall we have #{@students.count} great student".center(100)
  else
    puts "Overall we have #{@students.count} great students".center(100)
  end
end

#nothing happens until we call the methods
startup_load_students
interactive_menu
