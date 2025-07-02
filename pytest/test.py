import unittest
from entities.user import User
# from util.DBConnutil import DBConnUtil

#Sample test case for practice
class TestUserLogin(unittest.TestCase):
    def test_user_login(self):
        user = User(user_id=1, User_name = "Aarav Shah",User_password = "pass123" )
        self.assertEqual(user.get_user_id(), 1)
        self.assertEqual(user.get_user_name(), "Aarav Shah")
        self.assertEqual(user.get_user_password(), "pass123")
        print("User logged in successfully!")
if __name__ == "__main__":
    unittest.main()