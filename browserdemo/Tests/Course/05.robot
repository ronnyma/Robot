*** Settings ***
Library  Selenium2Library

Test Setup  Open the browser and navigate
Test Teardown  Close the browser

*** Variables ***
${salary}  100000
${tax}  20000
${tax class}  1

*** Test Cases ***
Tax Calculator Test
    [Documentation]  Testing the tax calculator. See the docs for business rules.
    Log  Open browser and navigate to the tax calculator
    Set correct tax class
    Enter salary info and calculate
    Get and verify calculated tax

*** Keywords ***
Open the browser and navigate
    open browser  http://transfinite.no/robot/  chrome
    wait until page contains  Welcome to the Tax Calculator!

Set correct tax class
    select from list by label  id=tax1  ${tax class}

Enter salary info and calculate
    input text  id=salary  ${salary}
    click button  id=calculate

Get and verify calculated tax
    Element Should Contain  id=outcome  ${tax}

Close the browser
    close browser
