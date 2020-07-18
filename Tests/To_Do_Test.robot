*** Settings ***
Library  Selenium2Library
Library  Collections
Library  String
Resource  ../Resources/LoadBrowser.robot
Resource  ../Resources/EndBrowser.robot
Resource  ../Resources/PO/AddItemTab.robot
Resource  ../Resources/PO/ToDoTab.robot
Resource  ../Resources/PO/CompletedTab.robot
Resource  ../Resources/MainPage.robot
Test Setup  LoadBrowser.Load
Test Teardown  EndBrowser.End


*** Variables ***
${TABS} =  xpath=//div[@class="mdl-tabs__tab-bar"] / a
@{TABS_LISTS} =  ADD ITEM  TO-DO TASKS  COMPLETED
${ADD_ITEMS_TABS} =  xpath=//div / a[1]
${INPUT_TEXT_FIELD} =  xpath=//input[@class="mdl-textfield__input"]
${ADD_BUTTON} =  xpath=//button[@data-upgraded=",MaterialButton"]

${ADD_ITEM_TAB} =  xpath=//div[@class="mdl-tabs__tab-bar"] / a[1]
${TO_DO_TASKS_TAB} =  xpath=//div[@class="mdl-tabs__tab-bar"] / a[2]
${COMPLETED_TAB} =  xpath=//div[@class="mdl-tabs__tab-bar"] / a[3]

*** Test Cases ***
Ensure that page TO DO LIST contains 3 tabs
    [Tags]  TC1
    MainPage.Check the numbers of TABS


Verify that each tab is order as Add item, To-do tasks, and completed
    [Tags]  TC2
    MainPage.Compare each tab with the expected result

Ensure that the added item will appear on TO-DO TASKS after clicking the (+) button
    [Tags]  TC3
    AddItemTab.Navigate to ADD ITEMS Tabs
    AddItemTab.Add item
    AddItemTab.Click add button

    ToDoTab.Navigate to TO DO TASKS Tab
    ToDoTab.Confirm the added item


Verify multiple items can be added and display in TO-DO Tasks respectively
    [Tags]  TC4
    AddItemTab.Add multiple items

    ToDoTab.Navigate to TO DO TASKS Tab
    ToDoTab.Check the to do list with added items

Ensure that the clicked item on TO-DO TASKS is deleted after clicking on it
    [Tags]  TC5

    AddItemTab.Add multiple items

    ToDoTab.Navigate to TO DO TASKS Tab
    ToDoTab.Count number of to do items
    ToDoTab.Get text of first item
    ToDoTab.Click on the delete button
    ToDoTab.Double check that item is deleted

Verify that nothing will happen when clicking add button while input box is empty
    [Tags]  TC6

    AddItemTab.Navigate to ADD ITEMS Tabs
    AddItemTab.Click add button

    ToDoTab.Navigate to TO DO TASKS Tab
    ToDoTab.Check that list is empty


Verify that deleted item on TO-DO TASKS tab will be appeared in COMPLETED tab
    [Tags]  TC7
    AddItemTab.Navigate to ADD ITEMS Tabs
    AddItemTab.Add item
    AddItemTab.Click add button

    ToDoTab.Navigate to TO DO TASKS Tab
    ToDoTab.Compare text in the list with the added item
    ToDoTab.Click on checkbox and check that that the item is disappear

    CompletedTab.Navigate to COMPLETED Tab
    CompletedTab.Compare the item with the added item


Verify that item will be deleted after clicking on the DELETE button on COMPLETED tab
    [TAGS]  TC8
    AddItemTab.Navigate to ADD ITEMS Tabs
    AddItemTab.Add item
    AddItemTab.Click add button

    ToDoTab.Navigate to TO DO TASKS Tab
    ToDoTab.Compare text in the list with the added item
    ToDoTab.Click on checkbox and check that that the item is disappear

    CompletedTab.Navigate to COMPLETED Tab
    CompletedTab.Compare the item with the added item
    CompletedTab.Delete item on the completed list
