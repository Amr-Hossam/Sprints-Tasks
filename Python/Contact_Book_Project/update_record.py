import csv
from delete_record import delete_record 
from user_input import user_input

def update_record():
                     # To update record
    delete_record()  #First you should delete old record
    print('*** Enter the updated record ***')
    user_input()     #Then Insert the new record


