# Write a program that checks whether a given order is delivered or not based on its status (e.g., "Processing," "Delivered," "Cancelled").Use if-else statements for this.
def courier_status_check(courier_status):
    if courier_status.lower() == "delivered":
        print("Your Courier is delivered!")
    elif courier_status.lower() == "in progress":
        print("Your courier is in dispatch and in progress of delivery!")
    elif courier_status.lower() == "pending":
        print("Your courier is yet to be dispatched.")
    else:
        print("Invalid courier status entered")

courier_status_check("Delivered")

# Implement a switch-case statement to categorize parcels based on their weight into "Light," "Medium," or "Heavy."
def weight_category(weight):
    match weight:
        case weight if weight <= 3.0:
            print("Your parcel is light.")
        case weight if weight > 3.0 and weight < 7.0:
            print("Your parcel is medium.")
        case weight if weight >= 7.0:
            print("Your parcel is heavy")
        case _:
            print("Invalid weight")

weight_category(4.5)

# Implement User Authentication 1. Create a login system for employees and customers using control flow statements.
users ={
   "Aarav Shah": "pass123",
   "Diya Mehra": "pass234",
   "Ravi Kumar": "pass345",
   "Sara Sharma": "pass456",
   "Nikhil Rao": "pass567",
   "Ananya Verma": "pass678",
   "Priya Arora": "pass789",
   "Kunal Joshi": "pass890",
   "Ishita Roy": "pass134",
   "Manav Desai":"pass153"
}
def user_login(user_name, user_password):
    if user_name in users and users[user_name] == user_password:
        print("Login Successful!")
    else:
        print("Invalid Credentials")

user_login("Aarav Shah","pass123")

# Implement Courier Assignment Logic 1. Develop a mechanism to assign couriers to shipments based on predefined criteria (e.g., proximity, load capacity) using loops.
Courier_staff = {
    "Courier_A":2,
    "Courier_B":4,
    "Courier_C":1,
    "Courier_D":3
}

def assign_courier():
    min_load = float('inf')
    assigned_courier = None
    for courier, load in Courier_staff.items():
        if load < min_load:
            min_load = load
            assigned_courier = courier

    Courier_staff[assigned_courier] += 1
    print(f"Assigned to {assigned_courier} (New load :{Courier_staff[assigned_courier]})")
assign_courier()
