*** Settings ***
Library    Collections
Library    String      
Resource    ../PageObjects/PageObjects_Home_Page.robot

*** Keywords ***       
I want food in "${lv_Search_Text}"
    Enter Postal Code In Dish Or Restaurant Search Box    ${lv_Search_Text}
    
I search for restaurants
    Click Search Button
    
Then I should see some restaurants in "${lv_Search_Text}"
     ${lv_Filter_Value}    Get Filter Value From Search Results Page
     ${lv_Filter_Status}    Run Keyword And Return Status    Should Contain    ${lv_Filter_Value}    ${lv_Search_Text}  
     Run Keyword If     ${lv_Filter_Status}    Log    Resturant Searched For the Criteria As Given '${lv_Filter_Value}'
     ...    ELSE    Fail   Resturant Are Not Searched For the Criteria As Given '${lv_Filter_Value}'
     ${list_Resturants_Displayed}    Get List Of All Resturants Displayed On Default Search Results Page
     ${lv_Number_Of_Resturants_Displayed}    Get Length    ${list_Resturants_Displayed}
     Run Keyword If     ${lv_Number_Of_Resturants_Displayed}>0    Log    Resturants Displayed On Default Search Results Page are:${list_Resturants_Displayed}
     ...    ELSE    Fail    No resturants are displayed for Search Criteria                 
 