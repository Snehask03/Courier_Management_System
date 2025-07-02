class InvalidEmployeeIdException(Exception):
    def __init__(self, message = "Invalid Employee ID entered"):
        super().__init__(message)