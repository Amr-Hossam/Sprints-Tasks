val = input ("Enter your value: ")                   #Take user's input 
open_brackets = [ "(", "{", "[" ]                    #Set list with the Open cases to check
close_brackets = [ ")", "}", "]" ]                   #Set list with the Closed cases to check

def isBalanced():                                    #Create Function to check if the input is balanced 
    stack = []                                       #Create Stack to list the open brackets
    list_val = list(val)                             #Turn the input string to list

    for i in list_val:                              #Check the list character by character          
        if i in open_brackets:                      # If the character is one of the open brackets
            stack.append(i)                         # then append this open bracket to the stack
        elif i in close_brackets:                   # If the character is one of the closed brackets   
            check_index = close_brackets.index(i)   # then detect what is the type of the bracket
            # Check if there is any open bracket in the stack 
            # Also check if the stack includes the open bracket for that closed one
            if ((len(stack) > 0 ) and (open_brackets[check_index] == stack[len(stack)-1])):
                # If ur here, It means that the closed bracket already has an open bracket in the stack
                stack.pop()                         # Remove the open bracket from the stack and len-1 is applied  
            else:
                return "False"                      # if the closed bracket has no open bracket 
                                                    # or comes before the open bracket return false

    if len(stack) == 0:                             #if the stack is empty and no open brackets without closed bracket
        return "True"       
    else:
        return "False"
            
print(isBalanced())                                 #Print the output of the function

