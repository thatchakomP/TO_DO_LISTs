*** Settings ***
Library  Selenium2Library

*** Variables ***


*** Keywords ***
Check the numbers of TABS
    ${count} =  get element count  ${TABS}
    should be equal as integers  ${count}  3

Compare each tab with the expected result
    ${count} =  get element count  ${TABS}
    FOR  ${index}  IN  @{tabs_lists}
        ${text} =  get text  ${ADD_ITEM_TAB}
        should be equal  ${text}  @{TABS_LISTS}
    END