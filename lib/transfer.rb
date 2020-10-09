require 'pry'
class Transfer
  # your code here'
  attr_accessor :amount, :sender, :receiver, :status
  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end
  def valid?
    if sender.valid? && receiver.valid? == true
      true
    else
      false 
    end
  end
  def execute_transaction
    if status != "complete"
      sender.balance -= amount 
      receiver.balance += amount
      self.status = "complete"
    end
    if not valid?
      @status = "rejected"
      p "Transaction rejected. Please check your account balance."
    end
    #binding.pry
  end
  def reverse_transfer
    if status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
