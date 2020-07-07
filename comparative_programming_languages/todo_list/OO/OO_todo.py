import os
import string
from Queue import Queue

# An Event class, declaring its structure and how to print
class Event:
    def __init__(self, name, date, time, location):
        self.name = name
        self.date = date
        self.time = time
        self.location = location

    # Describing how to print an Event object
    def __str__(self):
        return "\nEvent Name: {} \nDate: {} \nStart Time: {} \nLocation: {}".format(self.name, self.date, self.time, self.location)

# A Task class, declaring its structure and how to print
class Task:
    def __init__(self, name, date, time, duration, people):
        self.name = name
        self.date = date
        self.time = time
        self.duration = duration
        self.people = people

    # Describing how to print a Task object
    def __str__(self):
        return "\nTask Name: {} \nDate: {} \nTime: {} \nDuration: {} \nPeople: {}".format(self.name, self.date, self.time, self.duration, self.people)

# A ToDo class, declaring its attributes and functions
class ToDo():
    def __init__(self):
        self.q = Queue()
        self.running = True

    # A helper function that prints executable commands
    def help(self):
            print("1. Add an Event or a Task.\n" +
                  "2. Remove the most recent to-do list item.\n" + 
                  "3. View to-do list.\n" +
                  "4. Exit your to-do list.")

    # Adding an event or task?        
    def add(self):
        print("Would you like to add a task or an event?")
        job = input("Enter 't' for task or 'e' for event: ")
        if job.lower() == "t":
            self.addTask()
        elif job.lower() == "e":
            self.addEvent()
        else:
            print("Keyword not recognised!")

    # Removing the first item in the to-do list
    def remove(self):
        if not self.q.is_empty():
            status = input("You are about to remove the first item in your to-do list, proceed? (y/n): ")

            if status == "y":
                    self.q.dequeue()
                    print("First to-do item removed.")
            elif status == n:
                print("Removal Cancelled.")
            else:
                print("Input not recognised.")
        else:
            print("Operation not performed, List Empty!")
    
    # Printing the to-do list using the queue show() function in a nice format
    def showQ(self):
        if not self.q.is_empty():
            print(("#" * 10) + " To-Do List Contents " + ("#" * 10))
            self.q.show()
            print("\n" + ("#" * 10) + " END " + ("#" * 10))
        else:
            print("Your to-do list is empty!")

    # Quiting the to-do list
    def quit(self):
        print("Exiting your to-do list, goodbye")
        self.running = False

    # Adding a Task object to the to-do list
    def addTask(self):
        newTask = Task(input("\nTask Name: "), 
                       input("Date: "), 
                       input("Start Time: "), 
                       input("Duration: "), 
                  list(input("People assigned to task: ").split(string.punctuation)))

        self.q.enqueue(newTask)
        print("Task Successfully Added.\n")

    # Adding an Event object to the to-do list
    def addEvent(self):
        newEvent = Event(input("\nEvent Name: "), 
                         input("Date: "), 
                         input("Start Time: "), 
                         input("location: "))

        self.q.enqueue(newEvent)
        print("Event Successfully Added.\n")

    # Function gets called on instance of an object
    def run(self):
        # print a welcome message
        user = str(os.environ['USER'])
        print("Hello " + user + " and welcome to your to-do list!\n")

        self.help()

        # a dictionary of keys mapped to commands
        command_d = {1:self.add, 2:self.remove, 3:self.showQ, 4:self.quit, "h":self.help}

        while self.running:
            try:
                command = input("\nEnter a command (1 - 4) or enter h to see options again: ")

                if command.isdigit():
                    command = int(command)
                    command_d[command]()
                else:
                    command_d[command]()

            except ValueError:
                print("Please enter a number corresponding to the commands.")
            except KeyError:
                print("You have entered an unrecognized command!")
