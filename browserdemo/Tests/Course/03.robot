*** Settings ***
Library  Selenium2Library


*** Variables ***


*** Test Cases ***
Tax Calculator Test
    [Documentation]  Testing the tax calculator. See the docs for business rules.
    Log  Open browser and navigate to the tax calculator
    Open the browser and navigate
    Set correct tax class
    Enter salary info and calculate
    Get and verify calculated tax
    Close the browser

*** Keywords ***
Open the browser and navigate
    open browser  http://transfinite.no/robot/  chrome
    wait until page contains  Welcome to the Tax Calculator!

Set correct tax class
    select from list by label  id=tax1  1

Enter salary info and calculate
    input text  id=salary  100000
    click button  id=calculate

Get and verify calculated tax
    Element Should Contain  id=outcome  20000

Close the browser
    close browser
