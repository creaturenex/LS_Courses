# Loan Calculator application

LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file("loan_calculator_messages.yml")

def valid_num?(num)
  (num.to_f != 0.0) && (num.to_f.negative? != true)
end

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

loan_amount = ""
annual_percentate_rate = ""
loan_duration = ""
user_input = ""

prompt('hi')

prompt('info')

loop do
  loop do
    prompt('loan amount')
    loan_amount = gets.chomp
    if valid_num?(loan_amount)
      loan_amount = loan_amount.to_f
      break
    else
      prompt('valid num')
    end
  end

  loop do
    prompt('loan APR rate')
    annual_percentate_rate = gets.chomp
    if valid_num?(annual_percentate_rate)
      annual_percentate_rate = annual_percentate_rate.to_f
      break
    else
      prompt('valid num')
    end
  end

  loop do
    prompt('loan duration')
    loan_duration = gets.chomp
    if valid_num?(loan_duration)
      loan_duration = loan_duration.to_f
      break
    else
      prompt('valid num')
    end
  end

  monthly_payment =
    loan_amount * ((annual_percentate_rate * 0.01 / 12) /
    (1 - (1 + (annual_percentate_rate * 0.01 / 12))**(-(loan_duration * 12))))

  puts "=> Your monthly payment will be $#{monthly_payment.round(2)}"\
    " each month for #{loan_duration.to_i * 12} months."

  prompt('repeat')

  loop do
    user_input = gets.chomp.downcase
    if user_input == "n" || user_input == "y"
      break
    else
      puts "Please type either y/Y or n/N"
    end
  end

  break if user_input == 'n'
end

prompt('thanks')

=begin
m = p * (j / (1 - (1 + j)**(-n)))

m = monthly payment
p = loan amount
j = monthly interest rate
    - monthly interest rate =
        annual percentate rate (APR) * 0.01 / 12.0
    - 0.01 is to convert percentage to decimal
    - APR is divided by 12 to get the monthly interest rate
n = loan duration
    - loan duration is in years so it is multiplied
      by 12 to get loan duration in months
=end
