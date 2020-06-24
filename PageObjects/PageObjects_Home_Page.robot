*** Settings ***
Library    Selenium2Library
Library    Collections
Library    String      

*** Keywords ***          
Enter Postal Code In Dish Or Restaurant Search Box
    [Arguments]    ${lv_SearchText}
    Wait Until Page Contains Element    //input[@data-test-id='address-box-input']    20s
    Input Text    //input[@data-test-id='address-box-input']    ${lv_SearchText}
    
Click Search Button
    Wait Until Page Contains Element    //button[@data-test-id='find-restaurants-button']    20s 
    Click Element    //button[@data-test-id='find-restaurants-button']

Get Filter Value From Search Results Page
     ${lv_locator}    Set Variable    //div[contains(@class,'c-searchFilterSection')]//h1
     Wait Until Page Contains Element    ${lv_locator}    20s
     ${lv_Filter_Value}    Get Text    ${lv_locator}
     [Return]     ${lv_Filter_Value}
 
Get List Of All Resturants Displayed On Default Search Results Page                  
     ${list_Resturants_locator}    Get WebElements   //h3[@data-test-id='restaurant_name']
     ${list_Resturants_Displayed}    Create List
     FOR    ${List_Items}    IN    @{list_Resturants_locator}
         ${lv_Resturants_Name}    Get Text    ${List_Items}
         Append To List    ${list_Resturants_Displayed}
     END
     [Return]    {list_Resturants_Displayed}