class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && @status == "pending" && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "executed"
    end
  end

  def reverse_transfer
    if @status == "executed"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end
end
