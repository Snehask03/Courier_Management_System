class CourierUserServiceCollectionImpl:
    def __init__(self, company_obj):
        self.company_obj = company_obj

    def place_order(self, courier_obj):
        self.company_obj.courier_details.append(courier_obj)
        return courier_obj.Tracking_number

    def get_order_status(self, Tracking_number):
        for c in self.company_obj.courier_details:
            if c.Tracking_number == Tracking_number:
                return c.Courier_status
        return "Tracking number is not found"

    def cancel_order(self, Tracking_number):
        for c in self.company_obj.courier_details:
            if c.Tracking_number == Tracking_number:
                if c.Courier_status.lower() != "Pending":
                    return False
                c.Courier_status = "Cancelled"
                return True
        return False

    def get_assigned_order(self, EmployeeID):
        return [c for c in self.company_obj.courier_details if c.EmployeeID == EmployeeID]
