require 'minitest/autorun'
require 'minitest/pride'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  START_CASH = 100
  TRANS_COST = 100

  def setup
    @register = CashRegister.new(START_CASH)
    @transaction = Transaction.new(TRANS_COST)
  end

  def test_accept_money
    register = CashRegister.new(0)
    transaction = Transaction.new(100)
    transaction.amount_paid = 100
    register.accept_money(transaction)
    current_amt = register.total_money

    assert_equal 100, current_amt
  end

  def test_change
    @transaction.amount_paid = 150
    @register.accept_money(@transaction)

    assert_equal 50, @register.change(@transaction)
  end

  def test_give_receipt
    @transaction.amount_paid = 100
    @register.accept_money(@transaction)

    #do not forget the \n char as it is added by puts
    assert_output ("You've paid $100.\n") do
      @register.give_receipt(@transaction)
    end
  end

  # this is an incorrect, test as it only test the prompt not the amunt paid function witihn the method
  def test_prompt_for_payment_oscar # this is testing the prompt not the assiment of amount paid
    input = StringIO.new("100\n")

    assert_output ("You owe $#{@transaction.item_cost}.\nHow much are you paying?\n") do
      @transaction.prompt_for_payment(input: input)
    end
  end

  # LS Solution to test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end

end
