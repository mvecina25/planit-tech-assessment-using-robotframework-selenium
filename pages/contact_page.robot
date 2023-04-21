*** Settings ***
Documentation

Library    SeleniumLibrary

Resource    ../utils/keywords.robot
Resource    ../resources/constants.robot

*** Variables ***
${contact_element}             //a[contains(.,'Contact')]
${submit_button_element}       //a[contains(text(),'Submit')]
${forename_element}            //input[@id='forename']
${surname_element}             //input[@id='surname']
${email_element}               //input[@id='email']
${telephone_element}           //input[@id='telephone']
${message_element}             //textarea[@id='message']
${forename_error_element}      //span[@id='forename-err']
${email_error_element}         //span[@id='email-err']
${message_error_element}       //span[@id='message-err']
${alert_element}               //div[@class='alert alert-success']

*** Keywords ***
Click Contact Tab
    Wait Until Page Contains Element    ${contact_element}
    Click Element    ${contact_element}

Click Submit Button
    Wait Until Page Contains Element    ${submit_button_element}
    Click Element    ${submit_button_element}

Input Forename
    Wait Until Element Is Visible    ${forename_element}
    Input Text    ${forename_element}     ${FORENAME_TEXT}

Input Email
    Wait Until Element Is Visible    ${email_element}
    Input Text    ${email_element}     ${EMAIL_TEXT}

Input Message
    Wait Until Element Is Visible    ${message_element}
    Input Text    ${message_element}     ${MESSAGE_TEXT}

Verify Forename Error
    Element Should Contain    ${forename_error_element}    ${FORENAME_ERROR_MESSAGE}

Verify Email Error
    Element Should Contain    ${email_error_element}    ${EMAIL_ERROR_MESSAGE}

Verify Message Error
    Element Should Contain    ${message_error_element}    ${MESSAGE_ERROR_MESSAGE}

Verify No Forename Error
    Page Should Not Contain    ${FORENAME_ERROR_MESSAGE}

Verify No Email Error
    Page Should Not Contain    ${EMAIL_ERROR_MESSAGE}

Verify No Message Error
    Page Should Not Contain    ${MESSAGE_ERROR_MESSAGE}

Verify Alert Success Message
    Wait Until Page Contains Element    ${alert_element}    20s
    Element Should Contain    ${alert_element}    ${ALERT_SUCCESS_MESSAGE}