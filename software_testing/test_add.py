import unittest
from code.add import add

class addTestCase(unittest.TestCase):

    def test_one(self):
        self.assertEqual(add(2,2),4)

    def test_two(self):
        self.assertNotEqual(add(4,5),20)

    def test_three(self):
        self.assertNotAlmostEqual(add(2.1999,1.2),3.4)
        
if __name__ == '__main__':
    unittest.main()
