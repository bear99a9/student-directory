@students = []
@width = 120
# method for collecting the user data case statement option 1
def input_students(default_name, default_age, default_cohort)
  # while loop for asking questions
  while true do
    # ask for name of student
    puts "Please enter the name of the student".center(@width)
    puts "Enter 'typo' to re-enter the students data".center(@width)
    puts "TO FINISH INPUTTING STUDENT DATA, ENTER 'stop'".center(@width)
    # get the first name
    name = STDIN.gets.chomp
    name = default_name if name.empty?
    next if name == "typo"
    break if name == "stop"
    # ask for age
    puts "Please enter the age of the student".center(@width)
    puts "Enter 'typo' to re-enter the students data".center(@width)
    # get the age
    age = STDIN.gets.chomp
    age = default_age if age.empty?
    next if age == "typo"
    break if age == "stop"
    # ask for the cohort
    puts "Please enter the cohort of the student".center(@width)
    puts "Enter 'typo' to re-enter the students data".center(@width)
    # get the cohort
    cohort = STDIN.gets.chomp
    cohort = default_cohort if cohort.empty?
    next if cohort == "typo"
    break if cohort == "stop"
    #add the student hash to the array
    add_students(name, age, cohort)
    # prints out the student total
    puts "Now we have #{@students.count} student#{'s' if @students.count > 1}!".center(@width)
    end
  # return the array of students
  @students
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end
# method to print out the menus options
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end
# method prints out the output case statment 2
def show_students
  print_header
  print_student_by_cohort
  print_footer
end
# process method for case statement
def process(selection)
  case selection
    when "1"
      input_students("No name added", "No age added", "Unknown")
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end
# method for printing header
def print_header
  if !@students.empty?
    puts "The students of Villains Academy".center(@width)
    puts "-------------".center(@width)
  end
end
# method for printing students buy cohort
def print_student_by_cohort
  cohorts = @students.map do |student|
      student[:cohort]
  end
    cohorts.uniq.each do |cohort|
      puts "#{cohort} cohort:".upcase.center(@width)
      @students.each do |student|
        puts "#{student[:name]}, #{student[:age]}".center(@width) if student[:cohort] == cohort
      end
    end
end
# old method for printing students by index added
def print_student_by_index
  @students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]}, #{student[:age]}, #{student[:cohort]} cohort.".center(@width)
  end
end
# method for printing footer
def print_footer
  puts "The list is empty as no data was added by user!\nIf you have saved students data previously enter '4' to retrieve them." if @students.empty?
  puts "Overall, we have #{@students.count} great student#{'s' if @students.count > 1}!".center(@width) if !@students.empty?
end
# a method that saves student data to a .csv file
def save_students
  # open file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:age], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
# a method that loads the .csv file
def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, age, cohort = line.chomp.split(',')
    add_students(name, age, cohort)
  end
  file.close
end

def default_load_students
  filename = ARGV.first # first arguement from the command line
  if filename.nil?
    puts
    puts "Loaded the default file : students.csv"
    load_students
    puts "Loaded #{@students.count} from students.csv"
    puts
  elsif File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry #{filename} does not exist."
    exit # quit the program
  end
end

def add_students(name, age, cohort)
  @students << {name: name, age: age, cohort: cohort.to_sym}
end

default_load_students
interactive_menu
