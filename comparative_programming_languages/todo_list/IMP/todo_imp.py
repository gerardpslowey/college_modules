# global variable
to_do_file = "to_do.txt"

# Prints the commands
def help():
    print("1. Add an Event or a Task.\n" +
          "2. Remove the most recent to-do list item.\n" + 
          "3. View to-do list.\n" +
          "4. Exit your to-do list.\n")

# Creating a file if not present
def init_file():
    file = open(to_do_file, "a+")
    file.close()

# Adding to our file, task or event?
def add():
    print("Would you like to add a task or an event? ")
    job = input("Enter 't' for task or 'e' for an event: ")
    if job == "t":
        addTask()
    elif job == "e":
        addEvent()
    else:
        print("Keyword not recognised!")

# Add a Task
def addTask():
    name = input("Enter task name: ")
    date = input("Enter a date: ")
    start = input("Enter a start time: ")
    duration = input("Enter a duration: ")
    people = input("Enter people assigned: ")

    with open(to_do_file, "a") as f:
        f.write("Task Name: " + name + "; " + 
                "Date: " + date + ", " + 
                "Start Time: " + start + "; " + 
                "Duration: " + duration + "; " + 
                "Assigned People: " + "[" + people + "]" + "\n")
    print("Task Successfully Added.\n")

# Add an Event
def addEvent():
    name = input("Enter event name: ")
    date = input("Enter a date: ")
    start = input("Enter a start time: ")
    location = input("Enter a location: ")

    with open(to_do_file, "a") as f:
        f.write("Event Name: " + name + ", " + 
                "Date: " + date + ", " +
                "Start-Time: " + start + ", " +
                "Location: " + location + "\n")
    print("Event Successfully Added.\n")

# Remove the item added first
def remove():
    with open(to_do_file, "r") as f:
        lines = f.readlines()[1:]
    with open(to_do_file, "w") as f:
        if len(lines) > 0:
            for line in lines:
                f.write(line)
            print("Most Recent item removed!\n")

# Print the to-do list
def print_list():
    line_no = 1
    with open(to_do_file, "r") as f:
        lines = f.readlines()
        if len(lines) != 0:
            for line in lines:
                print(line_no, line)
                line_no += 1
        else:
            print("Your to-do list is empty!\n")

# Exit the programme
def quit():
    print("Exiting your to-do list, goodbye")
    exit(0)

# Command Checker
def run(job):
    if job == "1":
        add()

    elif job == "2":
        remove()

    elif job == "3":
        print_list()

    elif job == "h":
        help()

    elif job == "4":
        quit()

# Main command calls all neccessary functions
def main():
    init_file()
    print("Hello, and welcome to your to-do list!\n")
    help()

    while True:
        job = input("Enter a command (1 - 4) or 'h' to see commands again: ")
        run(job)

if __name__ == '__main__':
    main()
