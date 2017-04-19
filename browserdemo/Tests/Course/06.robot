*** Settings ***
Library  Selenium2Library

Test Setup  Open the browser
Test Teardown  Close the browser

*** Variables ***
${salary}  100000
${tax}  20000
${tax class}  1

*** Test Cases ***
Tax Calculator Test
    [Documentation]  Testing the tax calculator. See the docs for business rules.
    Log  Open browser and navigate to the tax calculator
    Navigate to app
    Set correct tax class
    Enter salary info and calculate
    Get and verify calculated tax

*** Keywords ***
Open the browser
    open browser  about:blank  chrome


Navigate to app
    Go to  http://transfinite.no/robot
    Wait until page contains  Welcome to the Tax Calculator!


Set correct tax class
    select from list by label  id=tax1  ${tax class}

Enter salary info and calculate
    input text  salary  ${salary}
    click button  calculate

Get and verify calculated tax
    Element Should Contain  id=outcome  ${tax}

Close the browser
    close browser
