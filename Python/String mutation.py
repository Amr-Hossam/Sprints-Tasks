### String mutation task ###
## We solved this problem with 2 solutions ##

# First solution 
# We created a function and gave it the string and position and character
def function(string='abracadabra' ,position=5 ,character='k'):     
    mylist= list(string) #Here we put the string in a list 
    mylist[position]= character #Replace the character 'a' with 'k'
    string = ''.join(mylist) #Return the list to string again 
    print (string)   #Print string
function() # Call function

# Second solution 
# We created a function and gave it the string and position and character
def function(string='abracadabra',position='5',character='k'):
    string = string[:5] + character + string[6:] # Write "abrac" then 'k' then "dabra" 
    print(string) # Print the new string
function() # Call function
