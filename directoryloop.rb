#first we print the list of students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student to the hash array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  student_index = 0
  student = students[student_index]
  while student_index < students.length do
    if student[:name].start_with?("T") && student[:name].length < 12
      puts (student_index + 1).to_s + ": " + (student[:name]).to_s + " (" + (student[:cohort]).to_s + " cohort)"
      student_index += 1
      student = students[student_index]
    else
      student_index += 1
      student = students[student_index]
    end
  end
end

def print_footer(students)
  puts "Overall we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
