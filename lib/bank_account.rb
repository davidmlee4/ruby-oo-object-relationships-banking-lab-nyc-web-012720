class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name,balance = 1000, status = "open")
        @name = name
        @balance = balance
        @status = status
    end

    def deposit(sum)
        self.balance += sum
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if status == "open" && self.balance > 0
            return true
        else
            return false
        end
    end

    def close_account
        self.status = "closed"
    end



end
