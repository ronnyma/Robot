*** Settings ***
Library  Selenium2Library
Test Setup  Open the browser
Test Teardown  Close the browser

*** Variables ***
&{item}  300000=120000  200000=70000  100000=25000  350000=210000  600000=420000  400000=240000
${key}  0
${salary}   0
${tax}  0

*** Test Cases ***
Tax Calculator Test
    [Documentation]  Testing the tax calculator. See the docs for business rules.
    Log  Open browser and navigate to the tax calculator
    Parameterized Test


*** Keywords ***
Parameterized Test
    Log  Testing tax class 2
    : FOR  ${key}  IN  @{item.keys()}
    \  Enter salary info and calculate  ${key}
    \  Get and verify calculated tax  ${item["${key}"]}

Open the browser
    open browser  http://transfinite.no/robot/  chrome
    wait until page contains  Welcome to the Tax Calculator!
    Set correct tax class


Set correct tax class
    select from list by label  id=tax1  2

Close the browser
    close browser

Enter salary info and calculate
    [Arguments]  ${salary}
    input text  id=salary  ${salary}
    click button  id=calculate

Get and verify calculated tax
    [Arguments]  ${tax}
    Element Should Contain  id=outcome  ${tax}
