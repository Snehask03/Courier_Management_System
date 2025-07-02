from util.DBConnutil import DBConnUtil
from entities.employee import Employee
from exceptions.InvalidEmployeeIdException import InvalidEmployeeIdException

class CourierAdminServiceImpl:
    def __init__(self):
        self.connection = DBConnUtil.get_connection()

    def add_courier_staff(self, employee_obj):
        cursor = None
        try:
            cursor = self.connection.cursor()
            insert_query = """
            INSERT INTO Employee (EmployeeID, Emp_name, Emp_email, Emp_contact_number, Emp_role, Salary)
            VALUES (%s, %s, %s, %s, %s, %s)
            """
            values = (
                employee_obj.get_employee_id(),
                employee_obj.get_emp_name(),
                employee_obj.get_emp_email(),
                employee_obj.get_emp_contact_number(),
                employee_obj.get_emp_role(),
                employee_obj.get_salary()
            )
            cursor.execute(insert_query, values)
            self.connection.commit()
            print(f"Courier Staff{employee_obj.get_emp_name()} added successfully with ID {employee_obj.get_employee_id()}.")
            return employee_obj.get_employee_id()
        except InvalidEmployeeIdException as e:
            print(f"Error", e)
            return None
        finally:
            if cursor:
                cursor.close()

if __name__ == "__main__":
    admin_service = CourierAdminServiceImpl()

    new_employee = Employee(
        EmployeeID = 11,
        Emp_name = "Tanvi Rathi",
        Emp_email= "tanvi@gmail.com",
        Emp_contact_number="9898989898",
        Emp_role="Dispatcher",
        Salary=48000
    )
    admin_service.add_courier_staff(new_employee)
