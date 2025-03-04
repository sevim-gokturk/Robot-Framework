*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Drag And Drop Test
    Open Browser    https://automationtesting.co.uk/actions.html    Chrome
    Wait Until Element Is Visible    xpath=//p[@id='dragtarget']    10s
    Wait Until Element Is Visible    xpath=//div[@class='col-6 col-12-medium ']//div[2]    10s
    # Perform the drag-and-drop action
    Drag And Drop    xpath=//p[@id='dragtarget']    xpath=//div[@class='col-6 col-12-medium ']//div[2]
    Sleep    2
    ${text}=    Get Text    xpath=//div[@class='col-6 col-12-medium ']//div[2]
    Should Be Equal    ${text}    Drag me!
    Close Browser
