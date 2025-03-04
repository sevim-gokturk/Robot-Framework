*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Verify New Tab Opens Google
    Open Browser    https://automationtesting.co.uk/browserTabs.html    chrome
    Click Button    xpath=//input[@value='Open Tab']
    Sleep    2s    # Wait for the new tab to open
    Switch Window    new
    Location Should Be    https://www.google.com/
    [Teardown]    Close All Browsers
