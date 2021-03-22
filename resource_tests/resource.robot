*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         www.aihitdata.com
${BROWSER}        Chrome
${DELAY}          1
${VALID EMAIL}     demo
${VALID PASSWORD}    mode
${WELCOME URL}    https://${SERVER}/
${LOGIN URL}      https://${SERVER}/login?next=https%3A//www.aihitdata.com/
${FILE NAME}      Result


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
    Click Button        Search

Click Download Button
    Wait Until Page Contains    Download    timeout=20
    Click Element      xpath://*[contains(text(), "Download")]

Input FileName
    Input Text    filename      ${FILE NAME}

Pass reCaptcha
    Click Element At Coordinates       class:g-recaptcha    xoffset=10  yoffset=10

Click reCaptcha Download Button
    Wait Until Element Is Enabled    DOWNLOAD    timeout=60
    Click Button      xpath://*[contains(text(), "DOWNLOAD")]

