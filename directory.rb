def input_students
  puts "Please enter the names of the student".center(120)
  puts "To finish, jut hit return twice".center(120)
  #create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # ask for age
  puts "Please enter the age of the student".center(120)
  puts "To finish, jut hit return twice".center(120)
  # get the age
  age = gets.chomp
  # until the name & age are empty, repeat this code
  until name.empty? && age.empty? do
    #add the student hash to the array
    students << {name: name, age: age, cohort: :november}
    puts "Now we have #{students.count} students".center(120)
    puts "Please enter the name and then age of the student".center(120)
    puts "To finish, jut hit return twice".center(120)
    # get another name from the user
    name = gets.chomp
    age = gets.chomp
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
    puts "#{index+1}. #{student[:name]} #{student[:age]} #{student[:cohort].capitalize} cohort".center(120)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(120)
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
