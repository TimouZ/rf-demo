*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         www.aihitdata.com
${BROWSER}        Chrome
${DELAY}          1
${VALID EMAIL}     demo
${VALID PASSWORD}    mode
${WELCOME URL}    https://${SERVER}/
${LOGIN URL}      https://${SERVER}/login?next=https%3A//www.aihitdata.com/
${ERROR URL}      https://${SERVER}

*** Keywords ***
Open Browser To Welcome Page
    Open Browser    ${WELCOME URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Welcome Page Should Be Open

Login Page Should Be Open
    Location Should Be  ${LOGIN URL}
    Title Should Be    aiHit Data

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Email
    [Arguments]    ${username}
    Input Text    email    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    LOGIN

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    The Company Database | aiHit

Input Mortgage
    [Arguments]    ${mortgage}
    Input Text    c    ${mortgage}

Input Location
    [Arguments]    ${location}
    Input Text    l   ${location}

Expand Filters
    Click Element    filtersHeading

Check Boxes
    Select Checkbox     hasWebsite
    Select Checkbox     hasEmail
    Select Checkbox     hasPhone
    Select Checkbox     hasAddress

Start Search
    Click Button    Search

Click Download
    Click Button    Download

Input FileName
    [Arguments]    ${file_name}
    Input Text    password    ${file_name}

