class CourierService:
    def __init__(self, ServiceID = None, ServiceName = None, Cost = None):
        self.__ServiceID = ServiceID
        self.__ServiceName = ServiceName
        self.__Cost = Cost

    def __str__(self):
        return f"CourierService [ID = {self.__ServiceID},Name = {self.__ServiceName}, Cost = {self.__Cost}]"

    #Getters
    def get_Service_id(self):
        return self.__ServiceID

    def get_service_name(self):
        return self.__ServiceName

    def get_cost(self):
        return self.__Cost

    #Setters
    def set_service_id(self, ServiceID):
        self.__ServiceID = ServiceID

    def set_service_name(self, ServiceName):
        self.__ServiceName = ServiceName

    def set_cost(self, Cost):
        self.__Cost = Cost