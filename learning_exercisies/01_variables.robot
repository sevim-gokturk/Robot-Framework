*** Variables ***
@{FRUITS}  Apple  Banana  Mango

*** Test Cases ***
List Example
    Log  ${FRUITS}[0]    # Logs "Apple"
    Log  ${FRUITS}[1]    # Logs "Banana"
    Log  ${FRUITS}       # Logs the whole list
    Log To Console  ${FRUITS}[0]    # Logs "Apple"