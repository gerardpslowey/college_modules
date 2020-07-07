import unittest
from code.add import add

class test_sentences(unittest.TestCase):

    def test_one(self):
        self.assertEqual(add("Hell", "o"), "Hello")

    def test_two(self):
        self.assertNotEqual(add("hEllO", "E"), "Hello")

    def test_three(self):
        self.assertFalse("Foo".isupper())

if __name__ == '__main__':
    unittest.main()
