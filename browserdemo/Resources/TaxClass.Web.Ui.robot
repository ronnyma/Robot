*** Settings ***
Library  Selenium2Library


*** Keywords ***
Parameterized Test
    Log  Testing tax class 1
    Navigate to app
    Set correct tax class
    : FOR  ${key}  IN  @{item.keys()}
    \  Enter salary info and calculate  ${key}
    \  Get and verify calculated tax  ${item["${key}"]}

Navigate to app
    Go to  http://transfinite.no/robot
    Wait until page contains  Welcome to the Tax Calculator!

Set correct tax class
    Select from list by label  id=tax1  1


Enter salary info and calculate
    [Arguments]  ${salary}
    input text  id=salary  ${salary}
    click button  id=calculate

Get and verify calculated tax
    [Arguments]  ${tax}
    Element Should Contain  id=outcome  ${tax}


