import unittest

class LongMessageTestCase(unittest.TestCase):

    def test_use_long_message(self):
        true_value = 14
        actual_value = 22
        self.assertNotEqual(true_value, actual_value, "two numbers are not equal")

if __name__ == '__main__':
    unittest.main()
