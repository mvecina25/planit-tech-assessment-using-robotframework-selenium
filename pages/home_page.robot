*** Settings ***
Documentation

Library    SeleniumLibrary

Resource    ../utils/keywords.robot

*** Variables ***
${home_element}        //a[contains(.,'Home')]

*** Keywords ***
Click Home Tab
    Wait Until Page Contains Element    ${home_element}
    Click Element    ${home_element}