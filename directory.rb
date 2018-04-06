#first we print the list of students
def input_students
  puts "Please enter the name, cohort and age of each student"
  puts "To finish entering names, just type stop"
  #create an empty array
  students = []
  #get the first name
  while true do
    puts "Please enter the name"
    name = gets.chomp
    if name == ""
      name = "Unknown"
    elsif name == "stop"
      break
    end
    puts "Please enter the cohort"
    cohort = gets.chomp
    if cohort == ""
      cohort = "Unknown"
    end
    puts "Please enter the age"
    age = gets.chomp
    if age == ""
      age = "Unknown"
    end
    individual_student_hash = {name: name, cohort: cohort, age: age}
    students << individual_student_hash
    if students.count < 2
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  students.each_with_index do |student, index|
    if student[:name].start_with?("T") && student[:name].length < 12
      puts "#{index + 1}: #{student[:name]} , age: #{student[:age]}, (#{student[:cohort]} cohort)"
    else
    end
  end
end

def print_footer(students)
  if students.count < 2
    puts "Overall we have #{students.count} great student".center(100)
  else
    puts "Overall we have #{students.count} great students".center(100)
  end
end

def edit_student(students)
  puts "Do you want to change any student information? Type Y/N"
  user_yesno_input = gets.chomp
  if user_yesno_input == "Y"
    puts "please enter the number of the student that you want to change"
    user_studentnumber_input = gets.chomp.to_i - 1
    puts "What do you want to change: name, age or cohort?"
    error = gets.chomp.to_sym
    puts "Please enter the correct #{error} "
    correction = gets.chomp
    students[user_studentnumber_input][error] = correction
    puts "#{error} updated to #{correction}"
  else
  end
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
edit_student(students)
print_header
print(students)
print_footer(students)
