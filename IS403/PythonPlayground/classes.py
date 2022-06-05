
class Person :
    def __init__ (self, sName, sAddress, sCity, sState, sZip) :
        self.name = sName
        self.address = sAddress
        self.city = sCity
        self.state = sState
        self.zip = sZip
class Customer(Person) :
    our_company = "ABC Accounting"
    def __init__ (self, sName, sAddress, sCity, sState, sZip, iNum_Emps) :
        super().__init__ (sName, sAddress, sCity, sState, sZip)
        self.num_employees = iNum_Emps
sName = input("Enter the customer name: ")
sAddress = input("Enter the address: ")
sCity = input("Enter the city: ")
sState = input("Enter the state: ")
sZip = input("Enter the zip code: ")
iNum_Emps = int(input("Enter the # of employees in the customer: "))
oCustomer = Customer(sName, sAddress, sCity, sState, sZip, iNum_Emps)