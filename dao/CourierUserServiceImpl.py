

from util.DBConnutil import DBConnUtil
from entities.courier import Courier
from exceptions.InvalidEmployeeIdException import InvalidEmployeeIdException
from exceptions.TrackingNumberNotFoundException import TrackingNumberNotFoundException

class CourierUserServiceImpl:
    tracking_counter = 11
    def __init__(self):
        self.connection = DBConnUtil.get_connection()

    # Placing a new order
    def place_order(self, courierobj):
        cursor = None
        try:
            cursor = self.connection.cursor()
            tracking_number = f"TK{CourierUserServiceImpl.tracking_counter:03d}"
            CourierUserServiceImpl.tracking_counter+=1
            insert_query = """
                INSERT INTO Courier(courierID, Sender_name, Sender_address, Receiver_name, Receiver_address,weight, Courier_status, Tracking_number, Delivery_date, Dispatch_date, ServiceID, EmployeeID)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """
            values = (
                courierobj.get_courier_id(),
                courierobj.get_sender_name(),
                courierobj.get_sender_address(),
                courierobj.get_receiver_name(),
                courierobj.get_receiver_address(),
                courierobj.get_weight(),
                courierobj.get_courier_status(),
                courierobj.get_tracking_number(),
                courierobj.get_delivery_date(),
                courierobj.get_dispatch_date(),
                courierobj.get_service_id(),
                courierobj.get_employee_id()

            )
            cursor.execute(insert_query, values)
            self.connection.commit()

            print(f"Order Placed sucessfully. Your tracking number is {tracking_number}")
            return tracking_number
        except Exception as e:
            print("Error placing order:", e)
            return None
        except TrackingNumberNotFoundException as e:
            print(f"Error", e)
        finally:
            if cursor:
                cursor.close()

    # Getting the order status using the tracking number
    def get_order_status(self, tracking_number):
        cursor = None
        try:
            cursor = self.connection.cursor()
            query = "SELECT Courier_status FROM courier WHERE Tracking_number = %s"
            cursor.execute(query,(tracking_number,))
            result = cursor.fetchone()
            if result:
                print(f"Status for {tracking_number}: {result[0]}")
            else:
                print("Tracking number not found.")
        except Exception as e:
            print("Error fetching order status:", e)
        except TrackingNumberNotFoundException as e:
            print(f"Error", e)
        finally:
            if cursor:
                cursor.close()

    def get_assigned_order(self, EmployeeID):
        cursor = None
        try:
            cursor = self.connection.cursor()
            query = """
            SELECT CourierID, Sender_name, Receiver_name, Courier_status, Tracking_number, Delivery_date, Dispatch_date, ServiceID, EmployeeID
            FROM Courier 
            WHERE EmployeeID = %s
            """
            cursor.execute(query, (EmployeeID,))
            orders = cursor.fetchall()
            if not orders:
                print(f"No orders assigned to employee ID {EmployeeID}")
                return []
            for order in orders:
                print(f"Courier ID: {order[0]}, Sender : {order[1]}, Receiver: {order[2]}, Status : {order[4]}, Tracking number:{order[5]}")
            return orders
        except InvalidEmployeeIdException as e:
            print(f"Error:", e)
            return None
        finally:
            if cursor:
                cursor.close()

    def cancel_order(self, Tracking_number):
        cursor = None
        try:
            cursor = self.connection.cursor()
            cursor.execute("SELECT Courier_status FROM Courier WHERE Tracking_number = %s", (Tracking_number,))
            result = cursor.fetchone()

            if result is None:
                raise TrackingNumberNotFoundException
            elif result[0] != "Pending":
                print("Only orders with status 'Pending' can be cancelled.")
                return False
            else:
                updated_query = "UPDATE Courier SET Courier_status = 'Cancelled' WHERE Tracking_number = %s"
                cursor.execute(updated_query, (Tracking_number,))
                self.connection.commit()
                print(f"order with tracking number {Tracking_number} cancelled successfully")
                return True
        except Exception as e:
            print("Error cancelling the order:", e)
            return False



if __name__ == "__main__":
    service = CourierUserServiceImpl()
    service.get_order_status("TK003")
    # courier = Courier(
    #     courierID = 11,
    #     Sender_name="Sejal",
    #     Sender_address="Chennai",
    #     Receiver_name="Shwetha",
    #     Receiver_address="Bangalore",
    #     weight=8.95,
    #     Courier_status="Pending",
    #     Tracking_number="TK011",
    #     Delivery_date= None,
    #     Dispatch_date=None,
    #     ServiceID= 1,
    #     EmployeeID=3
    # )
    # service.place_order(courier)
    service.cancel_order("TK011")
    service.get_assigned_order(3)

