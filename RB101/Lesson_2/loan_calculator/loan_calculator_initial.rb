# Initial attempt at calculator program

def valid_num?(num)
  ((num.to_i != 0) && (num.to_f != 0.0)) && ((num.to_i.to_s == num) || (num.to_f.to_s == num))

  # Best Anwser, code below does not allow negative value and does not allow Zero values. Because Zero values are not allowed, letters in a string are also not a valid number because the letters evaluate to 0 when "string".to_f
  # (num.to_f != 0.0) && (num.to_f.negative? != true)

  # This code allowed for negative values
  # ((num.to_i != 0) && (num.to_f != 0.0)) && ((num.to_i.to_s == num) || (num.to_f.to_s == num))

  # This code did not allow negative values but, (num.to_i != 0) does not allow for values between 0 and 1 ie 0.5, this was removed in the official application
  # (((num.to_i != 0) && (num.to_f != 0.0)) && ((num.to_i.negative? != true) || (num.to_f.negative? != true))) && ((num.to_i.to_s == num) || (num.to_f.to_s == num))

  # What is not needed from code above, after looking at LaunchSchool explanation
  # (num.to_i != 0) does not allow value 0.0-1.0
  # (num.to_i.negative? != true) as the float equlvient is also true
  # ((num.to_i.to_s == num) || (num.to_f.to_s == num)) is not needed, if (num.to_f != 0.0) is already present
end

loan_amount = ""
annual_percentate_rate = ""
loan_duration = ""

puts "=> Welcome to the Loan Calculator"

puts "=> We need some information from you"

loop do

  loop do
    puts "=> What is your loan amount?"
    loan_amount = gets.chomp
    if valid_num?(loan_amount)
      loan_amount = loan_amount.to_f
      break
    else
      puts "=> Please enter a valid number"
    end
  end

  loop do
    puts " => What is the loan Annual Percentate Rate % (APR)?
(Do not convert this percentage into a decimal)"
    annual_percentate_rate = gets.chomp
    if valid_num?(annual_percentate_rate)
      annual_percentate_rate = annual_percentate_rate.to_f
      break
    else
      puts "=> Please enter a valid number"
    end
  end

  loop do
    puts "=> What is the loan duration in years?"
    loan_duration = gets.chomp
    if valid_num?(loan_duration)
      loan_duration = loan_duration.to_f
      break
    else
      puts "=> Please enter a valid number"
    end
  end

# m = p * (j / (1 - (1 + j)**(-n)))

# m = monthly payment
# p = loan amount
# j = monthly interest rate
#     - monthly interest rate = annual percentate rate (APR) * 0.01 / 12.0
#     - 0.01 is to convert percentage to decimal
#     - APR is divided by 12 to get the monthly interest rate
# n = loan duration
#     - loan duration is in years so it is multiplied by 12 to get loan duration in months

  monthly_payment = loan_amount * ( (annual_percentate_rate * 0.01 / 12) / ( 1 - ( 1 + (annual_percentate_rate * 0.01 / 12) ) ** ( -(loan_duration * 12) ) ) )

  puts "=> Your monthly payment will be $#{monthly_payment.round(2)} each month for #{loan_duration.to_i * 12} months"

  puts "=> Would you like to perform another calculation? press Y or N"
  user_input = gets.chomp.downcase

break unless user_input == "y"
end

puts "=> Thank you for using the Mortgage Calculator!"
