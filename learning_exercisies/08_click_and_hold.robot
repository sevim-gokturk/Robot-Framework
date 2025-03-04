*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Click And Hold Test
    # Open the page
    Open Browser    https://automationtesting.co.uk/actions.html    Chrome

    # Wait for the element with the ID 'click-box' to be visible
    Wait Until Element Is Visible    xpath=//div[@id='click-box']    10s

    # Perform the 'click and hold' action on the element
    Mouse Down    xpath=//div[@id='click-box']

    # Verify the text while the mouse is held down
    ${text1}=    Get Text    xpath=//div[@id='click-box']
    Should Be Equal    ${text1}    Keep holding down!

    # Wait for 2 seconds to simulate holding
    Sleep    2

    # Release the mouse (mouse up action)
    Mouse Up    xpath=//div[@id='click-box']

    # Verify the text after releasing the mouse button
    ${text2}=    Get Text    xpath=//div[@id='click-box']
    Should Be Equal    ${text2}    No, don't let go :(
    
    # Close the browser
    Close Browser
