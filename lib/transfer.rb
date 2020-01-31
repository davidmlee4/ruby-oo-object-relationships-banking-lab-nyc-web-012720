class Transfer
  # your code here
  require_relative './bank_account.rb'
  require 'pry'

  attr_accessor :sender, :receiver, :status, :amount, :last_transfer


  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    
    if @status == "pending" && self.valid? && sender.balance > @amount 
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  

  end



end
