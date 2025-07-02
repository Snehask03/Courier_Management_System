class Courier:
    def __init__(self, courierID = None, Sender_name = None, Sender_address = None, Receiver_name = None, Receiver_address = None, weight = None, Courier_status = None, Tracking_number = None, Delivery_date = None, Dispatch_date = None, ServiceID = None, EmployeeID = None):
        self.__courierID = courierID
        self.__Sender_name = Sender_name
        self.__Sender_address = Sender_address
        self.__Receiver_name = Receiver_name
        self.__Receiver_address = Receiver_address
        self.__weight = weight
        self.__Courier_status = Courier_status
        self.__Tracking_number = Tracking_number
        self.__Delivery_date = Delivery_date
        self.__Dispatch_date = Dispatch_date
        self.__ServiceID = ServiceID
        self.__EmployeeID = EmployeeID

    def __str__(self):
        return f"Courier [ID = {self.__courierID},From = {self.__Sender_name}, To = {self.__Receiver_name}]"

    #getters
    def get_courier_id(self):
        return self.__courierID

    def get_sender_name(self):
        return self.__Sender_name

    def get_sender_address(self):
        return self.__Sender_address

    def get_receiver_name(self):
        return self.__Receiver_name

    def get_receiver_address(self):
        return self.__Receiver_address

    def get_weight(self):
        return self.__weight

    def get_courier_status(self):
        return self.__Courier_status

    def get_tracking_number(self):
        return self.__Tracking_number

    def get_delivery_date(self):
        return self.__Delivery_date

    def get_dispatch_date(self):
        return self.__Dispatch_date

    def get_service_id(self):
        return self.__ServiceID

    def get_employee_id(self):
        return self.__EmployeeID

    #Setters
    def set_courier_id(self, courierID):
        self.__courierID = courierID

    def set_sender_name(self, Sender_name):
        self.__Sender_name = Sender_name

    def set_sender_address(self, Sender_address):
        self.__Sender_address = Sender_address

    def set_receiver_name(self, Receiver_name):
       self.__Receiver_name = Receiver_name

    def set_receiver_address(self, Receiver_address):
        self.__Receiver_address = Receiver_address

    def set_weight(self, weight):
        self.__weight = weight

    def set_courier_status(self, Courier_status):
        self.__Courier_status = Courier_status

    def set_tracking_number(self, Tracking_number):
        self.__Tracking_number = Tracking_number

    def set_delivery_date(self, Delivery_date):
        self.__Delivery_date = Delivery_date

    def set_dispatch_date(self, Dispatch_date):
        self.__Dispatch_date = Dispatch_date

    def set_service_id(self, ServiceID):
        self.__ServiceID = ServiceID

    def set_employee_id(self, EmployeeID):
        self.__EmployeeID = EmployeeID
