*** Settings ***
Documentation    All the page objects and keywords of shop page
Library    SeleniumLibrary
Library    Collections
Resource    setup.robot

*** Variables ***

*** Keywords ***
Verify shop page
    Element Text Should Be    class:title    Products
Verify items title in the shop page
    @{expectedList}=    Create List    Sauce Labs Backpack    Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket    Sauce Labs Onesie    Test.allTheThings() T-Shirt (Red)
    Log List    ${expectedList}
    ${elements}=    Get WebElements    xpath:.//*[@class='inventory_item_label']/a/div
    Log List    ${elements}
    @{actualList} =   Create List
    FOR  ${element}  IN      @{elements}
        Append To List    ${actualList}     ${element.text}
    END
    Lists Should Be Equal   ${expectedList}    ${actualList}
Verify item detail
    [Arguments]    ${item_name}
    ${elements}=    Get WebElements    xpath:.//*[@class='inventory_item_label']/a/div
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${item_name}' == '${element.text}'
        ${index}=    Evaluate    ${index} + 1
    END
    Click Link    xpath:.//*[@class='inventory_item'][${index}]/div[2]/div[1]/a
    Element Text Should Be    xpath:.//*[@class='inventory_details_name large_size']    ${item_name}

    
