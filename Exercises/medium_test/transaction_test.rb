require 'minitest/autorun'
require 'pry'
require_relative 'transaction'


class TestTransaction < Minitest::Test
  def setup
    @transaction = Transaction.new(200)
  end

  def test_prompt_for_payment_output
    test = StringIO.new("200\n")
    output = StringIO.new

    @transaction.prompt_for_payment(input: test, output: output)

    assert_equal output.string, "You owe $200.\nHow much are you paying?\n"
  end

  def test_prompt_for_payment_success
    amount = StringIO.new("200\n")
    output = StringIO.new

    @transaction.prompt_for_payment(input: amount, output: output)
    assert_equal 200, @transaction.amount_paid
  end

  def test_prompt_for_payment_failure
    amount = StringIO.new("150\n" + "200\n")
    output = StringIO.new

    assert_output(/That is not the correct amount./) do
      @transaction.prompt_for_payment(input: amount, output: output)
    end
    assert_equal 200, @transaction.amount_paid
  end

end