*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Double Click Test
    # Open the page
    Open Browser    https://automationtesting.co.uk/actions.html    Chrome

    # Wait for the element to be visible
    Wait Until Element Is Visible    xpath=//p[@id='doubClickStartText']    10s

    # Perform the double-click action using ActionChains
    ${element}=    Get WebElement    xpath=//p[@id='doubClickStartText']
    Double Click Element    ${element}

    # Verify the text after double-clicking
    ${text}=    Get Text    xpath=//p[@id='doubClickStartText']
    Should Be Equal    ${text}    Well Done!

    # Close the browser
    Close Browser
