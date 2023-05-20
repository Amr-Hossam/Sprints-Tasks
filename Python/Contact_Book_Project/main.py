from user_input import user_input
from bulk_file_input import bulk_file_input
from delete_record import delete_record
from update_record import update_record

def choose_action():
    action = int()
    while True:
        # take the action number from user
        action = int(input('''
        What action do you want to do ? 
        1) Insert a new record
        2) Insert a bulk file records
        3) Update an existing record
        4) Delete a record
        '''))
        # make sure that the user entered the correct action number
        if action == 1 or action == 2 or action == 3 or action == 4:
            break
        else:
            # If user entered something else
            print("Please Enter 1 or 2 or 3 or 4")
            continue
    return action

while True:

    user_action = choose_action()               # Choose user action

    if user_action == 1:                        #If user wants to insert data by himself
        user_input()
    
    elif user_action == 2:                      #If user wants to insert data using the bulk file
        bulk_file_input()
        
    elif user_action == 3:                    #If user wants to update record
        update_record()
    
    elif user_action == 4:                    #If user wants to delete record
        delete_record()

    # Do you want to make anything else or break ?
    if(input("Do you want to take another action ? ( y / n ) ").casefold() == 'n'):
        break