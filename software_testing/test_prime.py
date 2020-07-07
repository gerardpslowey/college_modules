import unittest
from code.prime import is_prime

class test_primes(unittest.TestCase):

    def test_one(self):
        self.assertFalse(is_prime(14))

if __name__ == '__main__':
    unittest.main()
