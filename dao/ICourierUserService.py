from abc import ABC, abstractmethod

class ICourierUserService(ABC):

    @abstractmethod
    def place_order(self, courier_obj):
        pass

    @abstractmethod
    def get_order_status(self, Tracking_number):
        pass

    @abstractmethod
    def cancel_order(self, Tracking_number):
        pass

    @abstractmethod
    def get_assigned_order(self, EmployeeID):
        pass