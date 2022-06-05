class Bank_Account():
    def __init__(self):
        self.account_number = 0
        self.total_balance = 0.0

    def deposit(self, amt):
        pass

    def withdraw(self, amt):
        pass

    def get_balance(self):
        return(self.total_balance)


class Checking(Bank_Account):
    pass


class Savings(Bank_Account):
    pass


class Person:
    pass
