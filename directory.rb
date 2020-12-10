def input_students(default_name, default_age, default_cohort)
  # create an empty array
  students = []
  # while loop for asking questions
  while true do
    # ask for name of student
    puts "Please enter the name of the student".center(120)
    puts "Enter 'typo' to re-enter the students data".center(120)
    puts "TO FINISH AT ANY TIME, ENTER 'exit'".center(120)
    # get the first name
    name = gets.chomp
    name = default_name if name.empty?
    next if name == "typo"
    break if name == "exit"
    # ask for age
    puts "Please enter the age of the student".center(120)
    puts "Enter 'typo' to re-enter the students data".center(120)
    # get the age
    age = gets.chomp
    age = default_age if age.empty?
    next if age == "typo"
    break if age == "exit"
    # ask for the cohort
    puts "Please enter the cohort of the student".center(120)
    puts "Enter 'typo' to re-enter the students data".center(120)
    # get the cohort
    student_cohort = gets.chomp
    student_cohort = default_cohort if student_cohort.empty?
    next if student_cohort == "typo"
    break if student_cohort == "exit"
    #add the student hash to the array
    students << {name: name, age: age, cohort: student_cohort.to_sym}
    # prints out the student total
    puts "Now we have #{students.count} students!".center(120)
    end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(120)
  puts "-------------".center(120)
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]}, #{student[:age]}, #{student[:cohort]} cohort.".center(120)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students!".center(120)
end

students = input_students("No name added", "No age added", "Empty")
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
