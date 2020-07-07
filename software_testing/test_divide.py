import unittest
from code.divide import divide

class divideTestCase(unittest.TestCase):

    def test_one(self):
        self.assertEqual(divide(1,2),0.5)

    def test_two(self):
        self.assertNotEqual(divide(2,1),4)


if __name__ == '__main__':
    unittest.main()
