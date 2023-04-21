*** Settings ***
Documentation    Suite description

Library    SeleniumLibrary

Variables   ../resources/config.yaml

*** Keywords ***
Launch Browser
    Run Keyword    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window