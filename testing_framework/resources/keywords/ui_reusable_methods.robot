*** Settings ***
Library    SeleniumLibrary
Resource   ../pages/login_page.robot

*** Keywords ***
Input Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login Button
    Click Element    ${LOGIN_BUTTON}
    
