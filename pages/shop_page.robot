*** Settings ***
Documentation    Suite description

Library    SeleniumLibrary

Resource    ../resources/constants.robot

*** Variables ***
${shop_element}                                  //a[contains(.,'Shop')]
${buy_stuffed_frog_element}                      //li[@id='product-2']/div/p/a[@class='btn btn-success']
${buy_fluffy_bunny_element}                      //li[@id='product-4']/div/p/a[@class='btn btn-success']
${buy_valentine_bear_element}                    //li[@id='product-7']/div/p/a[@class='btn btn-success']
${cart_element}                                  //a[contains(.,'Cart')]
${cart_table_row_one_column_one_element}         //tbody/tr[1]/td[1]
${cart_table_row_two_column_one_element}         //tbody/tr[2]/td[1]
${cart_table_row_three_column_one_element}       //tbody/tr[3]/td[1]
${cart_table_row_one_column_two_element}         //tbody/tr[1]/td[2]
${cart_table_row_two_column_two_element}         //tbody/tr[2]/td[2]
${cart_table_row_three_column_two_element}       //tbody/tr[3]/td[2]
${card_table_row_one_column_three_element}       //tbody/tr[1]/td[3]/input[1]
${card_table_row_two_column_three_element}       //tbody/tr[2]/td[3]/input[1]
${card_table_row_three_column_three_element}     //tbody/tr[3]/td[3]/input[1]
${card_table_row_one_column_four_element}        //tbody/tr[1]/td[4]
${card_table_row_two_column_four_element}        //tbody/tr[2]/td[4]
${card_table_row_three_column_four_element}      //tbody/tr[3]/td[4]
${card_table_total_element}                      //tfoot/tr[1]

*** Keywords ***
Click Shop Tab
    Wait Until Page Contains Element    ${shop_element}
    Click Element    ${shop_element}

Click Buy Stuffed Frog
    Wait Until Page Contains Element    ${buy_stuffed_frog_element}
    Click Element    ${buy_stuffed_frog_element}

Click Buy Fluffy Bunny
    Wait Until Page Contains Element    ${buy_fluffy_bunny_element}
    Click Element    ${buy_fluffy_bunny_element}

Click Buy Valentine Bear
    Wait Until Page Contains Element    ${buy_valentine_bear_element}
    Click Element    ${buy_valentine_bear_element}

Click Cart
    Wait Until Page Contains Element    ${cart_element}
    Click Element    ${cart_element}

Verify Whether The Table Contains Stuffed Frog And Correct Price
    ${get_text_result}=    Get Text    ${cart_table_row_one_column_one_element}
    Run Keyword If    '${get_text_result}' == '${STUFFED_FROG}'
    ...    Verify Price For Stuffed Frog
    ...    ELSE    Fail    ${STUFFED_FROG} ${NOT_FOUND}
    ...    END

Verify Whether The Table Contains Fluffy Bunny And Correct Price
    ${get_text_result}=    Get Text    ${cart_table_row_two_column_one_element}
    Run Keyword If    '${get_text_result}' == '${FLUFFY_BUNNY}'
    ...    Verify Price For Fluffy Bunny
    ...    ELSE    Fail    ${FLUFFY_BUNNY} ${NOT_FOUND}
    ...    END

Verify Whether The Table Contains Valentine Bear And Correct Price
    ${get_text_result}=    Get Text    ${cart_table_row_three_column_one_element}
    Run Keyword If    '${get_text_result}' == '${VALENTINE_BEAR}'
    ...    Verify Price For Valentine Bear
    ...    ELSE    Fail    ${VALENTINE_BEAR} ${NOT_FOUND}
    ...    END

Verify Price For Stuffed Frog
    Wait Until Page Contains Element    ${cart_table_row_one_column_two_element}
    Element Should Contain    ${cart_table_row_one_column_two_element}    ${STUFFED_FROG_PRICE}

Verify Price For Fluffy Bunny
    Wait Until Page Contains Element    ${cart_table_row_two_column_two_element}
    Element Should Contain    ${cart_table_row_two_column_two_element}    ${FLUFFY_BUNNY_PRICE}

Verify Price For Valentine Bear
    Wait Until Page Contains Element    ${cart_table_row_three_column_two_element}
    Element Should Contain    ${cart_table_row_three_column_two_element}    ${VALENTINE_BEAR_PRICE}

Verify Whether The Table Contains Stuffed Frog And Correct Quantity
    ${get_text_result}=    Get Text    ${cart_table_row_one_column_one_element}
    Run Keyword If    '${get_text_result}' == '${STUFFED_FROG}'
    ...    Verify Price For Stuffed Frog
    ...    ELSE    Fail    ${STUFFED_FROG} ${NOT_FOUND}
    ...    END

Verify Whether The Table Contains Fluffy Bunny And Correct Quantity
    ${get_text_result}=    Get Text    ${cart_table_row_two_column_one_element}
    Run Keyword If    '${get_text_result}' == '${FLUFFY_BUNNY}'
    ...    Verify Price For Fluffy Bunny
    ...    ELSE    Fail    ${FLUFFY_BUNNY} ${NOT_FOUND}
    ...    END

Verify Whether The Table Contains Valentine Bear And Correct Quantity
    ${get_text_result}=    Get Text    ${cart_table_row_three_column_one_element}
    Run Keyword If    '${get_text_result}' == '${VALENTINE_BEAR}'
    ...    Verify Price For Valentine Bear
    ...    ELSE    Fail    ${VALENTINE_BEAR} ${NOT_FOUND}
    ...    END

Verify Quantity For Stuffed Frog
    Wait Until Page Contains Element    ${card_table_row_one_column_three_element}
    Element Should Contain    ${card_table_row_one_column_three_element}    3

Verify Quantity For Fluffy Bunny
    Wait Until Page Contains Element    ${card_table_row_two_column_three_element}
    Element Should Contain    ${card_table_row_two_column_three_element}    5

Verify Quantity For Valentine Bear
    Wait Until Page Contains Element    ${card_table_row_three_column_three_element}
    Element Should Contain    ${card_table_row_three_column_three_element}    2

Verify The Subtotal For Stuffed Frog
    ${subtotal}=    Evaluate    ${STUFFED_FROG_PRICE} * 3
    Element Should Contain    ${card_table_row_one_column_four_element}    ${DOLLAR_SIGN}${subtotal}

Verify The Subtotal For Fluffy Bunny
    ${subtotal}=    Evaluate    ${FLUFFY_BUNNY_PRICE} * 5
    Element Should Contain    ${card_table_row_two_column_four_element}    ${DOLLAR_SIGN}${subtotal}

Verify The Subtotal For Valentine Bear
    ${subtotal}=    Evaluate    ${VALENTINE_BEAR_PRICE} * 2
    Element Should Contain    ${card_table_row_three_column_four_element}    ${DOLLAR_SIGN}${subtotal}

Verify The Total Items
    ${subtotal1}=    Evaluate    ${STUFFED_FROG_PRICE} * 3
    ${subtotal2}=    Evaluate    ${FLUFFY_BUNNY_PRICE} * 5
    ${subtotal3}=    Evaluate    ${VALENTINE_BEAR_PRICE} * 2
    ${total}=        Evaluate    ${subtotal1} + ${subtotal2} + ${subtotal3}
    Element Should Contain        ${card_table_total_element}     ${total}