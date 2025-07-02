from entities.courier import Courier
from dao.CourierUserServiceImpl import CourierUserServiceImpl
from exceptions.TrackingNumberNotFoundException import TrackingNumberNotFoundException


def main():
    service = CourierUserServiceImpl()

    while True:
        print("\n ---- Courier Management System ----")
        print("1. Place Order")
        print("2. Get Order status")
        print("3. Cancel order")
        print("4. Get assigned orders")
        print("5. Exit")

        choice = input("Enter your choice: ")

        if choice == '1':
            try:
                courierID = int(input("Enter the courier ID: "))
                Sender_name = input("Enter the sender name: ")
                Sender_address = input("Enter the sender address: ")
                Receiver_name = input("Enter the receiver name: ")
                Receiver_address = input("Enter the receiver address: ")
                weight = float(input("Enter weight: "))
                Courier_status = input("Enter the courier status")
                Tracking_number = input("Enter your tracking number: ")
                Delivery_date = input("Enter the delivery date(YYYY-MM-DD): ")
                Dispatch_date = input("Enter the dispatch date(YYYY-MM-DD): ")
                ServiceID = int(input("Enter the service ID: "))
                EmployeeID = int(input("Enter the assigned employee ID: "))

                courier = Courier(
                    courierID, Sender_name, Sender_address, Receiver_name, Receiver_address,weight, Courier_status, Tracking_number, Delivery_date, Dispatch_date, ServiceID, EmployeeID
                )
                tracking = service.place_order(courier)
                print("Tracking Number:", tracking)
            except Exception as e:
                print("Error placing order", e)
        elif choice == '2':
            tracking = input("Enter tracking number: ")
            service.get_order_status(tracking)

        elif choice == '3':
            tracking = input("Enter tracking number to cancel: ")
            result = service.cancel_order(tracking)
            if result:
                print("Order cancelled!")
            else:
                raise TrackingNumberNotFoundException
        elif choice == '4':
            emp_id = int(input("Enter the employee id: "))
            orders = service.get_assigned_order(emp_id)
            if not orders:
                print("No assigned orders")
        elif choice == '5':
            print("Exiting")
            break
        else:
            print("Invalid Choice. Try again")

if __name__ == "__main__":
    main()
