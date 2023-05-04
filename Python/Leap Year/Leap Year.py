year =  input("Enter Year: ")  #Enter the year
input_year=year # Store the year value to use it later in the print

def is_leap(year):  # Generate function to check if the input year is leap or not
    
    # Give the condition as the Gregorian calender
    if( (year %4 ==0) and (year %100 !=0) or (year %400 ==0) ):
      # Print the output
        print("True  Year " + input_year + " Is a leap year")
    
    # if the condition is False and not a leap year
    else:
        # Print the output
        print("False  Year "+ input_year + " Isn't a leap year") 

is_leap(int(year)) # Call the function