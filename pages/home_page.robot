*** Settings ***
Documentation

Library    SeleniumLibrary

Resource    ../utils/keywords.robot

*** Variables ***
&{home_elements}    
...    home_tab=//a[contains(.,'Home')]

*** Keywords ***
Click Home Tab
    Wait Until Page Contains Element    ${home_elements.home_tab}
    Click Element    ${home_elements.home_tab}