*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/keywords/ui_reusable_methods.robot
Resource   ../../resources/variables/ui_common_variables.robot


*** Test Cases ***
Successful Login Test
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Input Username    ${VALID_USERNAME}
    Input Password    ${VALID_PASSWORD}
    Click Login Button
    Wait Until Page Contains    ${HOME_PAGE_WELCOME_MESSAGE}
    Close Browser
