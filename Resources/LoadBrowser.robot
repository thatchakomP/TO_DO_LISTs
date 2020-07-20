*** Settings ***
Library  Selenium2Library


*** Keywords ***
Load
    open browser  https://abhigyank.github.io/To-Do-List/  chrome
    set selenium speed  0.5s
    page should contain element  xpath=//h1
    page should contain  To Do List