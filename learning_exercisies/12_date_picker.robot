*** Settings ***
Library           SeleniumLibrary
Library           DateTime

*** Variables ***
${URL}                https://automationtesting.co.uk/datepicker.html
${TARGET_YEAR}        2028
${TARGET_MONTH}       April
${TARGET_DAY}         19
${TARGET_HOUR}        05
${TARGET_MINUTE}      30
${EXPECTED_DATETIME}  April, 19 2028 05:30

*** Test Cases ***
Select Expected Date and Time
    [Documentation]    Test to select the date: 19 April 2028, 05:30 AM from the date picker.
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # 1. Open the date picker
    Click Element    xpath=(//input[@id='basicDate'])[1]
    Sleep    1s

    # 2. Set the year
    ${current_year}    Get Current Date    result_format=%Y
    Log To Console    ${current_year}
    ${year_diff}=    Evaluate    int(${TARGET_YEAR}) - int(${current_year})
    Run Keyword If    ${year_diff} > 0    Click Year Next    ${year_diff}
    ...    ELSE IF    ${year_diff} < 0    Click Year Previous    ${abs(${year_diff})}

    # 3. Set the month using the full month name
    ${current_month}=   Get Current Date    result_format=%B
    Log To Console    ${current_month}
    ${target_month_index}=    Get Month Index    ${TARGET_MONTH}
    ${current_month_index}=   Get Month Index    ${current_month}
    ${month_diff}=    Evaluate    int(${target_month_index}) - int(${current_month_index})
    Run Keyword If    ${month_diff} > 0    Click Month Next    ${month_diff}
    ...    ELSE IF    ${month_diff} < 0    Click Month Previous    ${abs(${month_diff})}

    # 4. Select the day (aria-label format: "Month Day, Year")
    ${aria_label}=    Set Variable    ${TARGET_MONTH} ${TARGET_DAY}, ${TARGET_YEAR}
    Log To Console   ${aria_label}
    Sleep    1s
    Scroll Element Into View    xpath=//span[@aria-label='${aria_label}']
    Click Element               xpath=//span[@aria-label='${aria_label}']

    # 5. Set the time: Check AM/PM, input hour and minute
    ${ampm}=    Get Text    xpath=//span[@class='flatpickr-am-pm']
    Run Keyword If    '${ampm}'=='PM'    Click Element    xpath=//span[@class='flatpickr-am-pm']
    Sleep    0.5s
    Clear Element Text    xpath=(//input[@title='Scroll to increment'])[2]
    Input Text    xpath=(//input[@title='Scroll to increment'])[2]    ${TARGET_HOUR}
    Clear Element Text    xpath=(//input[@title='Scroll to increment'])[3]
    Input Text    xpath=(//input[@title='Scroll to increment'])[3]    ${TARGET_MINUTE}
    Sleep    1s

    # 6. Verify the selected date and time
    ${actual_value}=    Get Value    xpath=(//input[@id='basicDate'])[1]
    Log    Selected date and time: ${actual_value}
    Should Be Equal    ${actual_value}    ${EXPECTED_DATETIME}

    [Teardown]   Close Browser

*** Keywords ***
Get Current Year 
    [Documentation]    Returns the current year displayed in the date picker.
    ${year}=    Get Element Attribute    xpath=//div[@class='flatpickr-current-month']/input[@class='numInput']    value
    RETURN    ${year}

Get Current Month
    [Documentation]    Returns the current month displayed in the date picker.
    ${month}=    Get Text    xpath=//div[@class='flatpickr-current-month']/span[@class='cur-month']
    RETURN    ${month}

Get Month Index
    [Arguments]    ${month_name}
    ${months}=    Create List    January    February    March    April    May    June    July    August    September    October    November    December
    ${index}=     Evaluate    ${months}.index("${month_name}") + 1
    RETURN    ${index}

Click Year Next
    [Arguments]    ${times}
    FOR    ${i}    IN RANGE    ${times}
        Click Element    xpath=(//span[@class='arrowUp'])[1]
        Sleep    0.5s
    END

Click Year Previous
    [Arguments]    ${times}
    FOR    ${i}    IN RANGE    ${times}
        Click Element    xpath=(//span[@class='arrowDown'])[1]
        Sleep    0.5s
    END

Click Month Next
    [Arguments]    ${times}
    FOR    ${i}    IN RANGE    ${times}
        Click Element    xpath=//span[@class='flatpickr-next-month']
        Sleep    0.5s
    END

Click Month Previous
    [Arguments]    ${times}
    FOR    ${i}    IN RANGE    ${times}
        Click Element    xpath=//span[@class='flatpickr-prev-month']
        Sleep    0.5s
    END