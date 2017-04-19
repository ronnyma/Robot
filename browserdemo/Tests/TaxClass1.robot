*** Settings ***
Library  Selenium2Library
Resource  ../Resources/Common.robot
Resource  ../Resources/TaxClass.Web.Ui.robot


Test Setup  Common.Open the browser
Test Teardown  Close the browser


*** Variables ***
&{item}  300000=90000  200000=50000  100000=20000  350000=140000  600000=300000  400000=160000
${key}  0
${salary}   0
${tax}  0

*** Test Cases ***
Tax Calculator Test
    [Documentation]  Testing the tax calculator. See the docs for business rules.
    Log  Open browser and navigate to the tax calculator
    TaxClass.Web.Ui.Parameterized Test


