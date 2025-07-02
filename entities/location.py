class Location:
    def __init__(self, LocationID = None, LocationName = None, Address = None):
        self.__LocationID = LocationID
        self.__LocationName = LocationName
        self.__Address = Address

    def __str__(self):
        return f"Location [ID = {self.__LocationID},Name = {self.__LocationName}, Address = {self.__Address}]"

    #Getters
    def get_location_id(self):
        return self.__LocationID

    def get_location_name(self):
        return self.__LocationName

    def get_address(self):
        return self.__Address

    # Setters
    def set_location_id(self, LocationID):
        self.__LocationID = LocationID

    def set_location_name(self, LocationName):
        self.__LocationName = LocationName

    def set_address(self, Address):
        self.__Address = Address