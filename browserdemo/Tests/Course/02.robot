*** Settings ***
Library  Selenium2Library

*** Variables ***


*** Test Cases ***
Tax Calculator Test
    [Documentation]  Testing the tax calculator. See the docs for business rules.
    Log  Open browser and navigate to the tax calculator
    open browser  http://transfinite.no/robot/  chrome
    wait until page contains  Welcome to the Tax Calculator!
    select from list by label  id=tax1  1
    input text  id=salary  100000
    click button  id=calculate
    Element Should Contain  id=outcome  20000
    close browser


*** Keywords ***


