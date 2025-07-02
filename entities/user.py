class User:
     def __init__(self, user_id = None, User_name = None, Email = None, User_password = None, ContactNumber = None, Address = None):
         self.__user_id = user_id
         self.__User_name = User_name
         self.__Email = Email
         self.__User_password = User_password
         self.__ContactNumber = ContactNumber
         self.__Address = Address

     def __str__(self):
        return f"User [ID = {self.__user_id},Name = {self.__User_name}, Email = {self.__Email}]"


     # Getters
     def get_user_id(self):
         return self.__user_id

     def get_user_name(self):
         return self.__User_name

     def get_email(self):
         return self.__Email

     def get_user_password(self):
         return self.__User_password

     def get_contact_number(self):
         return self.__ContactNumber

     def get_address(self):
         return self.__Address

     #Setters
     def set_user_id(self, user_id):
         self.__user_id = user_id

     def set_user_name(self, User_name):
         self.__User_name = User_name

     def set_email(self, Email):
         self.__Email = Email

     def set_user_password(self, User_password):
         self.__User_password = User_password

     def set_contact_number(self, ContactNumber):
         self.__ContactNumber = ContactNumber

     def set_address(self, Address):
         self.__Address = Address
