import csv
import os
from datetime import datetime
from phone_number_list import phone_number_list
now = datetime.now()
file_name = "contactbook_" + now.strftime("%d%m%Y") + ".csv"        #To generate file_current-date.csv

def user_input():
    with open(file_name, newline='') as csv_file:
        if os.stat(file_name).st_size == 0:         # If file is empty or no header line exist then write the header line
            with open(file_name, 'w', newline='') as csv_file:
                csv_writer = csv.writer(csv_file)
                csv_writer.writerow(["Username", "Email", "Phone_number", "Address", "Date"])  # Write the header line
        
        with open(file_name, 'a', newline='') as csv_file:  # If the header line exist then start to append data
            csv_writer = csv.writer(csv_file)
            Username= input("Enter username:")      # Add username
            Email= input("Enter email:")            # Add email
            phone_number= phone_number_list()       # Add phone number as list     
            Address = input("Enter address:")       # Add Address
            Date= now.strftime("%d/%m/%Y %H:%M:%S") # Add date 
            csv_writer.writerow([Username, Email, phone_number, Address, Date ])        # Append contact data

