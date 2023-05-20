## Take User bulk file input and append it to our csv ##
import csv 
from datetime import datetime
now = datetime.now()
file_name = "contactbook_" + now.strftime("%d%m%Y") + ".csv"        #To generate file_current-date.csv

def bulk_file_input():

    fileinput = str(input("Insert bulk file name: "))        #Takes bulk file input name
    with open(fileinput, 'r', newline='') as user_bulk_file:            #Read file 
        bulk_file = user_bulk_file.read()

    with open(file_name, 'a', newline='') as csv_file:              #Append the file to my contact book
        csv_file.write(bulk_file)