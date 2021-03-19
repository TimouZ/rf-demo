*** Settings ***
Documentation     https://www.aihitdata.com/ scraping robot
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Welcome Page
    Go To Login Page
    Input Email     timuzlov@gmail.com
    Input Password    TestPassword11
    Submit Credentials
    Input Mortgage      mortgage
    Input Location      USA
    Expand Filters
    Check Boxes
    Start Search
    Click Download
    Input FileName      Results