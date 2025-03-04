*** Settings ***
Library    Collections

*** Variables ***
@{FRUITS}  Apple  Banana  Mango

*** Test Cases ***
List Example  # Demonstrating list usage
    Log  ${FRUITS}[0]    # Logs "Apple"
    Log  ${FRUITS}[1]    # Logs "Banana"
    Log  ${FRUITS}       # Logs the whole list

Modify List  # Adding and removing elements from the list
    Append To List    ${FRUITS}    Grapes  # Adds "Grapes" to the list
    Remove Values From List    ${FRUITS}    Banana  # Removes "Banana" from the list
    Log  ${FRUITS}       # Logs the whole list