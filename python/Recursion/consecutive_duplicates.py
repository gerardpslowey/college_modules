#
#  Just a class to store the item and the next pointer
#
class Node:
    def __init__(self, item, next):
        self.item = item
        self.next = next

# Note, these are methods "A method is a function that is stored as a class attribute"
class LinkedList:
    def __init__(self):
        self.head = None

    def add(self, item):
        self.head = Node(item, self.head)

    def remove(self):
        if self.is_empty():
            return None
        else:
            item = self.head.item
            self.head = self.head.next    # remove the item by moving the head pointer
            return item

    def is_empty(self):
        return self.head == None

#################################################################################################        
    def duplicates(self):
        return r_duplicates(self.head)

	def r_duplicates(self, ptr):
	    if ptr == None or ptr.next == None:
	        return False
	    elif ptr.item == ptr.next.item:
	        return True
	    else:
	        return r_duplicates(ptr.next)
################################################################################################

import sys

def main():
    # Read each set
    line = sys.stdin.readline()
    items = line.strip().split()
    
    ll = LinkedList()
    bool = str(ll.duplicates())[0]
    print(bool, end="")  # Only print the first letter of the result (F for false, T for true)
    for item in items:
        ll.add(item)
        bool = str(ll.duplicates())[0] # Only print the first letter of the result
        print(bool, end="")
        
    print()

if __name__ == "__main__":
    main()