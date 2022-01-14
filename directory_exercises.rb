# Exercises:
# 1. We're using the each() method to iterate over an array of students. How can you modify 
#     the program to print a number before the name of each student, e.g. "1. Dr. Hannibal Lecter"? Hint: look into each_with_index()
# 2. Modify your program to only print the students whose name begins with a specific letter.
# 3. Modify your program to only print the students whose name is shorter than 12 characters.
# 4. Rewrite the each() method that prints all students using while or until control flow methods (Loops).
# 5. Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc.
# 6. Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned.
# 7. In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort? 
#     What if one of the values is empty? Can you supply a default value? The input will be given to you as a string? 
#     How will you convert it to a symbol? What if the user makes a typo?
# 8. Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. 
#     To do this, you'll need to get a list of all existing cohorts (the map() method may be useful but it's not the only option), 
#     iterate over it and only print the students from that cohort.
# 9. Right now if we have only one student, the user will see a message "Now we have 1 students", 
#     whereas it should be "Now we have 1 student". How can you fix it so that it uses the singular 
#     form when appropriate and plural form otherwise?
# 10. We've been using the chomp() method to get rid of the last return character. Find another method among those 
#     provided by the String class that could be used for the same purpose (although it will require passing some arguments).
# 11. Once you have completed the "Asking for user input" section, open this file. It's Ruby code but it has some typos. 
#     Copy it to a local file and open it in VS Code without syntax highlighting. To do this, change the language of the file from 
#     'Ruby' to 'Plain Text' by clicking the blue word 'Ruby' in the bottom right corner and searching for 'plain text'.
# 12. Now, find all typos in that file and correct them. Use your experience, online documentation, etc. to find all the mistakes. 
#     Run the script in the terminal from time to time to make sure it works as it should. Google the errors Ruby gives you, 
#     think about what they could mean, try different things but don't look the answer up :)
#     What happens if the user doesn't enter any students? It will try to print an empty list. 
#     How can you use an if statement (Control Flow) to only print the list if there is at least one student in there?

# create a method to allow user input to fill the names in the student array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp.capitalize
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp.capitalize
  end
  # return the array of students
  students
end

# print the header
def print_header
  puts "The students of Villains Academy whose name begins with '#{@selection}'."
  puts "-------------"
end

# user should input a letter to be used to select the student names beginning with given letter
def selected_letter
  p "Select the students whose name starts with the letter...?"
  @selection = gets.chomp.to_s.capitalize
end

# select only the students from the 'students' array which start with the selected letter and are less than 12 letters
def select_students(students)
  of_letter = students.select { |x| x[:name].start_with? (@selection) }
  @selected_students = of_letter.select { |y| y[:name].length < 12 }
end

# print the list of students, iterating over the array to print name and cohort
def print(students)
  @selected_students.each_with_index do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#print footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call the methods
students = input_students
selected_letter
chosen_by_first_letter = select_students(students)
print_header
print(chosen_by_first_letter)
print_footer(students)