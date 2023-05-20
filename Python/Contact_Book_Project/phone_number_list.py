def phone_number_list():
    phone_number=[]

    while True:
            phone_number.append(int(input("Enter phone number:"))) 
            # IF the user wants to add another phone number then enter Y else enter N
            choice = input("Do you want to enter another number ? ( y / n )") 
            if choice.casefold() == 'n':
                break

    return phone_number