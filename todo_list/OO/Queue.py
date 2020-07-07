class Queue(object):

    # Constructor to create an empty list
    def __init__(self):
        self.queue = []

    # Adding elements to the queue
    def enqueue(self,item):
        self.queue.append(item)

    # Checking if the queue is empty or not
    def is_empty(self):
        return len(self.queue) == 0

    # Removing the last element from the queue
    def dequeue(self):
        if len(self.queue) < 1:
            return None
        else:
            return self.queue.pop(0)

    # printing the list
    def show(self):
        for item in self.queue:
            print(item)
