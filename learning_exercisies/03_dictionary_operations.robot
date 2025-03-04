*** Settings ***
Library    Collections

*** Variables ***
# List variable storing multiple values
@{FRUITS}  Apple  Banana  Mango  Orange

# Dictionary variable storing key-value pairs
&{USER}    name=John    age=30    city=New York

*** Test Cases ***
Dictionary Example  # Demonstrating dictionary usage
    ${length}=    Get Length    ${FRUITS}  # Getting the length of the list
    Log To Console    Length of fruit list is ${length}  # Logs the length of the list
    Log To Console  ${USER.name}    # Logs "John"
    Log To Console  ${USER["age"]}  # Logs "30"
    Log To Console  ${USER}         # Logs full dictionary

Modify Dictionary  # Adding and removing dictionary keys
    Set To Dictionary    ${USER}    country=USA  # Adds a new key-value pair
    Remove From Dictionary    ${USER}    city  # Removes the "city" key
    Log To Console  ${USER}  # Logs updated dictionary

Convert List To Dictionary  # Converting list and dictionary data
    ${dict} =    Create Dictionary    name=Alice    age=25  # Creating a dictionary
    ${keys} =    Get Dictionary Keys    ${dict}   # Gets keys as a list
    ${values} =  Get Dictionary Values  ${dict}   # Gets values as a list
    Log  ${keys}  # Logs dictionary keys
    Log  ${values}  # Logs dictionary values

Pass Dictionary  # Passing dictionary to a keyword
    Print User Info    &{USER}

*** Keywords ***
Print User Info  # Keyword to print user details
    [Arguments]  &{info}  # Accepts a dictionary as an argument
    Log To Console  User ${info.name} is ${info.age} years old.
