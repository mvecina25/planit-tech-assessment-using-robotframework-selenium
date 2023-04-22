*** Settings ***
Documentation

Library    SeleniumLibrary

Resource    ../utils/keywords.robot
Resource    ../resources/constants.robot

*** Variables ***
&{contact_elements}    
...    contact_tab=//a[contains(.,'Contact')]
...    submit_button=//a[contains(text(),'Submit')]
...    forename=//input[@id='forename']
...    surname=//input[@id='surname']
...    email=//input[@id='email']
...    telephone=//input[@id='telephone']
...    message=//textarea[@id='message']
...    forename_error=//span[@id='forename-err']
...    email_error=//span[@id='email-err']
...    message_error=//span[@id='message-err']
...    alert=//div[@class='alert alert-success']

*** Keywords ***
Click Contact Tab
    Wait Until Page Contains Element    ${contact_elements.contact_tab}
    Click Element    ${contact_elements.contact_tab}

Click Submit Button
    Wait Until Page Contains Element    ${contact_elements.submit_button}
    Click Element    ${contact_elements.submit_button}

Input Forename
    Wait Until Element Is Visible    ${contact_elements.forename}
    Input Text    ${contact_elements.forename}     ${FORENAME_TEXT}

Input Email
    Wait Until Element Is Visible    ${contact_elements.email}
    Input Text    ${contact_elements.email}     ${EMAIL_TEXT}

Input Message
    Wait Until Element Is Visible    ${contact_elements.message}
    Input Text    ${contact_elements.message}     ${MESSAGE_TEXT}

Verify Forename Error
    Element Should Contain    ${contact_elements.forename_error}    ${FORENAME_ERROR_MESSAGE}

Verify Email Error
    Element Should Contain    ${contact_elements.email_error}    ${EMAIL_ERROR_MESSAGE}

Verify Message Error
    Element Should Contain    ${contact_elements.message_error}    ${MESSAGE_ERROR_MESSAGE}

Verify No Forename Error
    Page Should Not Contain    ${FORENAME_ERROR_MESSAGE}

Verify No Email Error
    Page Should Not Contain    ${EMAIL_ERROR_MESSAGE}

Verify No Message Error
    Page Should Not Contain    ${MESSAGE_ERROR_MESSAGE}

Verify Alert Success Message
    Wait Until Page Contains Element    ${contact_elements.alert}    20s
    Element Should Contain    ${contact_elements.alert}    ${ALERT_SUCCESS_MESSAGE}