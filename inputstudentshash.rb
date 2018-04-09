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
    puts "Please enter the age"
    age = gets.chomp
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

def print(students)
  students.each_with_index do |student, index|
      puts "#{index + 1}: #{student[:name]}, age: #{student[:age]}, (#{student[:cohort]} cohort)"
  end
end

students = input_students
print(students)
