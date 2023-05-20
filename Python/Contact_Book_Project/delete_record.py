# To remove fields from a CSV file, you can’t directly remove them.
# Instead, you must read all of the fields in the CSV file,
# Then write to another CSV file, excluding all fields you don’t want

import csv
from datetime import datetime
now = datetime.now()
file_name = "contactbook_" + now.strftime("%d%m%Y") + ".csv"   #To generate file_current-date.csv

def delete_record():
    record= input("Enter recorded username to delete: ")       #Get the record which the user wants to delete

    with open(file_name, 'r', newline='') as file1:             #To delete the record you should read and search within the file
        reader= csv.reader(file1)                               
        with open('latest.csv', 'w', newline='') as file2:      #Then write the data of the contactbook to file lastest.csv 
            writer = csv.writer(file2)                          
            for row in reader:                                   
                if row[0] != record:                            #If we found the wanted record then don't write it to latest 
                    writer.writerow(row)                        # Write all records without wanted record to the file

    with open('latest.csv', 'r', newline='') as file2:          #All the new records exists in latest.csv, so let's return the new data to our original file
        reader=csv.reader(file2)                                # Read records inside latest.csv
        with open(file_name, 'w', newline='') as file1:         # Write the new records to the original file
            writer = csv.writer(file1)
            for row in reader:
                writer.writerow(row)                            # Now the original file contains all records except the deleted ones

