*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
__Wait Until Page Contains Element Keyword
    [Arguments]    ${arg}
    Wait Until Page Contains Element    ${arg}    error=Failed: Element "${arg}" NOT found!