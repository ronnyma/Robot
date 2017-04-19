*** Settings ***
Library  Selenium2Library



*** Variables ***

*** Test Cases ***
Logall
  Logger  Tjofaderittan  Greek

*** Keywords ***
Logger
  [Arguments]  ${a}  ${b}
  Log  ${a} ${b}