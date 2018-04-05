#first we print the list of students
def input_students
  puts "Please enter the name, cohort and age of each student (separated by commas e.g. Voldemort, november, 150)"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  individual_student_array = gets.chomp.split(", ")
  name = individual_student_array[0]
  cohort = individual_student_array[1]
  age = individual_student_array[2]
  #while the name is not empty, repeat this code
  while !individual_student_array.empty? do
    #add the student to the hash array
    students << {name: name, cohort: cohort, age: age}
    if students.count < 2
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    #get another name from the user
    individual_student_array = gets.chomp.split(", ")
    name = individual_student_array[0]
    cohort = individual_student_array[1]
    age = individual_student_array[2]
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
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
