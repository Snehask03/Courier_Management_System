class Payment:
    def __init__(self, PaymentID = None, CourierID = None, LocationID = None, Amount = None, PaymentDate = None):
        self.__PaymentID = PaymentID
        self.__CourierID = CourierID
        self.__LocationID = LocationID
        self.__Amount = Amount
        self.__PaymentDate = PaymentDate

    def __str__(self):
        return f"Payment [ID = {self.__PaymentID},CourierID = {self.__CourierID}, Amount = {self.__Amount}]"

    # Getters
    def get_payment_id(self):
        return self.__PaymentID

    def get_courier_id(self):
        return self.__CourierID

    def get_location_id(self):
        return self.__LocationID

    def get_amount(self):
        return self.__Amount

    def get_payment_date(self):
        return self.__PaymentDate

    # Setters
    def set_payment_id(self, PaymentID):
        self.__PaymentID = PaymentID

    def set_courier_id(self, CourierID):
        self.__CourierID = CourierID

    def set_location_id(self, LocationID):
        self.__LocationID = LocationID

    def set_amount(self, Amount):
        self.__Amount = Amount

    def set_payment_date(self, PaymentDate):
        self.__PaymentDate = PaymentDate
