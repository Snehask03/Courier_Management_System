class Employee:
    def __init__(self, EmployeeID = None, Emp_name = None, Emp_email = None, Emp_contact_number = None, Emp_role = None, Salary = None):
        self.__EmployeeID = EmployeeID
        self.__Emp_name = Emp_name
        self.__Emp_email = Emp_email
        self.__Emp_contact_number = Emp_contact_number
        self.__Emp_role = Emp_role
        self.__Salary = Salary

    def __str__(self):
        return f"Employee [ID = {self.__EmployeeID},Name = {self.__Emp_name}, Email = {self.__Emp_email}, Role = {self.__Emp_role}]"

    #Getters
    def get_employee_id(self):
        return self.__EmployeeID

    def get_emp_name(self):
        return self.__Emp_name

    def get_emp_email(self):
        return self.__Emp_email

    def get_emp_contact_number(self):
        return self.__Emp_contact_number

    def get_emp_role(self):
        return self.__Emp_role

    def get_salary(self):
        return self.__Salary

    #Setters

    def set_employee_id(self, EmployeeID):
        self.__EmployeeID = EmployeeID

    def set_emp_name(self, Emp_name):
        self.__Emp_name = Emp_name

    def set_emp_email(self, Emp_email):
        self.__Emp_email = Emp_email

    def set_emp_contact_number(self, Emp_contact_number):
        self.__Emp_contact_number = Emp_contact_number

    def set_emp_role(self, Emp_role):
        self.__Emp_role = Emp_role

    def set_salary(self, Salary):
        self.__Salary = Salary

