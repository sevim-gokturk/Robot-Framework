*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Verify Button Click Methods
    Open Browser    https://automationtesting.co.uk/buttons.html    chrome
    
    # WebElement Click
    Sleep   1s    # Wait for the page to load
    Click Element     xpath=//button[text()='Button One']
    Sleep   1s    # Wait for the alert to appear
    Alert Should Be Present    You clicked the first button!
    Reload Page
    
    # JavaScript Click
    Sleep   1s    # Wait for the page to load
    Execute JavaScript    document.getElementById('btn_two').click()
    Sleep   1s    # Wait for the alert to appear
    Alert Should Be Present    You clicked the second button!
    Reload Page

    
    # Action Move & Click
    Sleep   1s    # Wait for the page to load
    ${element}    Get WebElement    xpath=//button[@id='btn_three']
    Execute JavaScript    arguments[0].scrollIntoView();    ARGUMENTS    ${element}
    Click Element    xpath=//button[@id='btn_three']
    Sleep   1s    # Wait for the alert to appear
    Alert Should Be Present    You clicked the third button!
    Reload Page


    # Enable and Click Disabled Button
    Sleep   1s    # Wait for the page to load
    Execute JavaScript    document.getElementById('btn_four').removeAttribute('disabled').click()
    Sleep   1s    # Wait for the alert to appear
    Click Button    xpath=//button[@id='btn_four']
    Sleep   1s    # Wait for the alert to appear
    Alert Should Be Present    You clicked the fourth button!

    [Teardown]    Close Browser

*** Comments ***
# This test case verifies three different ways of clicking buttons:
# 1. Standard WebElement click using SeleniumLibrary's Click Button.
# 2. JavaScript click using Execute JavaScript to bypass potential UI blockers.
# 3. Action move and click using JavaScript scrollIntoView() followed by Click Element.
# After each click, it verifies the corresponding popup message and handles the alert.