require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(500)
    transaction = Transaction.new(200)
    transaction.amount_paid = 200

    assert_equal(500, register.total_money)

    register.accept_money(transaction)

    assert_equal(700, register.total_money)
  end

  def test_change
    register = CashRegister.new(500)
    transaction = Transaction.new(200)
    transaction.amount_paid = 220

    change_due = register.change(transaction)

    assert_equal(change_due, transaction.amount_paid - transaction.item_cost)
  end

  def test_give_reciept
    register = CashRegister.new(500)
    transaction = Transaction.new(200)

    assert_output("You've paid $200.\n") { register.give_receipt(transaction) }
  end

end