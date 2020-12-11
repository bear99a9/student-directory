def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9 Exit" # 9 because I've got to add more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      # input the students
      students = input_students("No name added", "No age added", "Unknown")
    when "2"
      # show the students
      print_header(students)
      print_student_by_cohort(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
      # 4. repeat from step 1
    end
  end
end

def input_students(default_name, default_age, default_cohort)
  # create an empty array
  students = []
  # while loop for asking questions
  while true do
    # ask for name of student
    puts "Please enter the name of the student".center(120)
    puts "Enter 'typo' to re-enter the students data".center(120)
    puts "TO FINISH INPUTTING STUDENT DATA, ENTER 'stop'".center(120)
    # get the first name
    name = gets.strip
    name = default_name if name.empty?
    next if name == "typo"
    break if name == "stop"
    # ask for age
    puts "Please enter the age of the student".center(120)
    puts "Enter 'typo' to re-enter the students data".center(120)
    # get the age
    age = gets.strip
    age = default_age if age.empty?
    next if age == "typo"
    break if age == "stop"
    # ask for the cohort
    puts "Please enter the cohort of the student".center(120)
    puts "Enter 'typo' to re-enter the students data".center(120)
    # get the cohort
    student_cohort = gets.strip
    student_cohort = default_cohort if student_cohort.empty?
    next if student_cohort == "typo"
    break if student_cohort == "stop"
    #add the student hash to the array
    students << {name: name, age: age, cohort: student_cohort.to_sym}
    # prints out the student total
    puts "Now we have #{students.count} student#{'s' if students.count > 1}!".center(120)
    end
  # return the array of students
  students
end
# method for printing header
def print_header(students)
  if !students.empty?
    puts "The students of Villains Academy".center(120)
    puts "-------------".center(120)
  end
end
# method for printing students buy cohort
def print_student_by_cohort(students)
  cohorts = students.map do |student|
      student[:cohort]
  end
    cohorts.uniq.each do |cohort|
      puts "#{cohort} cohort".upcase.center(120)
      students.each do |student|
        puts "#{student[:name]}, #{student[:age]}" if student[:cohort] == cohort
      end
    end
end
# old method for printing students by index added
def print_student_by_index(students)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]}, #{student[:age]}, #{student[:cohort]} cohort.".center(120)
  end
end
# method for printing footer
def print_footer(students)
  puts "The list is empty as no data was added by user!".center(120) if students.empty?
  puts "Overall, we have #{students.count} great student#{'s' if students.count > 1}!".center(120) if !students.empty?
end
# # variable for students info with default parameters entered
# students = input_students("No name added", "No age added", "Unknown")
# # nothing happens until we call the methods
# print_header(students)
# #print_student_by_index(students)
# print_student_by_cohort(students)
# print_footer(students)
interactive_menu
