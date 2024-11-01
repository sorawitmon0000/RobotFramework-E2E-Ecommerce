*** Settings ***
Documentation   E2E test e-commerce website
Library     SeleniumLibrary
Library     Collections
Library    ../lib/Custom.py
Resource    ../PO/setup.robot
Resource    ../PO/loginPage.robot
Resource    ../PO/shopPage.robot
Resource    ../PO/cartPage.robot
Test Setup    Open the website
Test Teardown    Close browser session

*** Variables ***
${products_list}    Sauce Labs Backpack    Sauce Labs Bike Light

*** Test Cases ***
# log in section
 alidate unsuccesful login with invalid password
     loginPage.Fill the login form    ${username_valid}   ${username_invalid}
     loginPage.Verify unsuccesful login
 Validate unsuccesful login with invalid username
     loginPage.Fill the login form    ${username_invalid}   ${username_valid}
     loginPage.Verify unsuccesful login
 Validate unsuccesful login with invalid usernamme and invalid password
     loginPage.Fill the login form    ${username_invalid}   ${password_invalid}
     loginPage.Verify unsuccesful login
 Validate succesful login
     loginPage.Fill the login form    ${username_valid}   ${password_valid}
     shopPage.Verify shop page

# shop section
Validate products in shop page
    loginPage.Fill the login form    ${username_valid}   ${password_valid}
    shopPage.Verify items title in the shop page
Validate product detail in shop page
    loginPage.Fill the login form    ${username_valid}   ${password_valid}
    shopPage.Verify item detail    Sauce Labs Fleece Jacket   
    
# E2E section
End to end e-commerce product validation
    loginPage.Fill the login form    ${username_valid}   ${password_valid}
    add items to cart and checkout    ${products_list}
    cartPage.Checkout cart
    cartPage.Verify statement
    