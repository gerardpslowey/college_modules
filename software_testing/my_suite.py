import unittest

from test_add import addTestCase
from test_divide import divideTestCase
from test_prime import test_primes
from test_sent import test_sentences

def my_suite():
    suite = unittest.TestSuite()

    suite.addTest(unittest.makeSuite(addTestCase))
    suite.addTest(unittest.makeSuite(divideTestCase))
    suite.addTest(unittest.makeSuite(test_primes))
    suite.addTest(unittest.makeSuite(test_sentences))

    runner = unittest.TextTestRunner()
    print(runner.run(suite))

my_suite()
