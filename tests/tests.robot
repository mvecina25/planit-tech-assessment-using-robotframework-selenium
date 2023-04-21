*** Settings ***
Documentation    Suite description

Library     SeleniumLibrary

Resource    ../utils/browser_setup.robot
Resource    ../pages/contact_page.robot
Resource    ../pages/shop_page.robot

Test Setup  Run Keywords  Launch Browser
Test Teardown  Close Browser

*** Test Cases ***
Test Case 1
    Click Contact Tab
    Click Submit Button
    Run Keyword And Continue On Failure    Verify Forename Error
    Run Keyword And Continue On Failure    Verify Email Error
    Run Keyword And Continue On Failure    Verify Message Error
    Input Forename
    Input Email
    Input Message
    Run Keyword And Continue On Failure    Verify No Forename Error
    Run Keyword And Continue On Failure    Verify No Email Error
    Run Keyword And Continue On Failure    Verify No Message Error

Test Case 2
    Click Contact Tab
    Input Forename
    Input Email
    Input Message
    Run Keyword And Continue On Failure    Verify No Forename Error
    Run Keyword And Continue On Failure    Verify No Email Error
    Run Keyword And Continue On Failure    Verify No Message Error
    Click Submit Button
    Verify Alert Success Message
    Sleep    3s

Test Case 3
    Click Shop Tab
    Click Buy Stuffed Frog
    Click Buy Fluffy Bunny
    Click Buy Valentine Bear
    Click Cart
    Sleep    3s
    Verify Whether The Table Contains Stuffed Frog And Correct Price
    Verify Whether The Table Contains Fluffy Bunny And Correct Price
    Verify Whether The Table Contains Valentine Bear And Correct Price
    Sleep    2s

Test Case 4
    Click Shop Tab
    Click Buy Stuffed Frog
    Click Buy Stuffed Frog
    Click Buy Stuffed Frog
    Click Buy Fluffy Bunny
    Click Buy Fluffy Bunny
    Click Buy Fluffy Bunny
    Click Buy Fluffy Bunny
    Click Buy Fluffy Bunny
    Click Buy Valentine Bear
    Click Buy Valentine Bear
    Click Cart
    Sleep    3s
    Verify Whether The Table Contains Stuffed Frog And Correct Price
    Verify Whether The Table Contains Fluffy Bunny And Correct Price
    Verify Whether The Table Contains Valentine Bear And Correct Price
    Verify Whether The Table Contains Fluffy Bunny And Correct Quantity
    Verify Whether The Table Contains Stuffed Frog And Correct Quantity
    Verify Whether The Table Contains Valentine Bear And Correct Quantity
    Verify The Subtotal For Stuffed Frog
    Verify The Subtotal For Fluffy Bunny
    Verify The Subtotal For Valentine Bear
    Verify The Total Items
    Sleep    2s