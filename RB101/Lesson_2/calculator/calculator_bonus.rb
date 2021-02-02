LANGUAGE = 'en'
require 'yaml'
MESSAGES = YAML.load_file('/home/oscar/LS_Courses/RB101/L2E14_calculator_bonus_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

# First method
# I used the following method to translate the language used in this program. It worked. I also consider a similar method to what launchschool provided but was not 100% sure how to access the different levels within a file in YAML.

# puts "What Language would you like use? English, Spanish, French?"
# language = gets().chomp().downcase
  # case language
  # when "english"
   # MESSAGES = YAML.load_file('/home/oscar/LS_Courses/RB101/L2E14_calculator_bonus_messages_en.yml')
  # when "spanish"
   # MESSAGES = YAML.load_file('/home/oscar/LS_Courses/RB101/L2E14_calculator_bonus_messages_sp.yml')
  # when "french"
    # MESSAGES = YAML.load_file('/home/oscar/LS_Courses/RB101/L2E14_calculator_bonus_messages_fr.yml')
  # end

  # this required no changes to the prompt method or the prompt messages

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  math = case op
    # case statement saved to varible to be called on
    # after additional code added to the operation_to_message method.
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
  math # varible is being called as last item in method
end

prompt('welcome')

name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

puts(prompt('hi').to_s + "#{name}!")

# prompt("hi")
# puts(" #{name}!")
# figure out how to include user imput

loop do # main loop
  number1 = ''

  loop do
    prompt('first_number')
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt('valid_number')
    end
  end

  number2 = ''

  loop do
    prompt('second_number')
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    else
      prompt('valid_number')
    end
  end

#  operator_prompt = <<-MSG
#  What operation would you like to perform?
#    1) add
#    2) subtract
#    3) multiply
#    4) divide
#  MSG

  prompt('operator_prompt')

  operator = ''

  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('operation_choice')
    end
  end

  print ("#{operation_to_message(operator)}")
  prompt('function_performed')

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt('result')
  puts(" #{result}!")

  prompt('recalculate')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('good_bye')
