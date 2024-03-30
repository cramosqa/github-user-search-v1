*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${APP URL}    http://localhost:3000/
${BROWSER}    headlesschrome

*** Test Cases ***

Page Usability

    # Open
    Open Browser To Initial Page
    Capture Page Screenshot    page_usability_capture1_{index}.png

    # Assert
    #${page_icon}=     Get Element Attribute      github-icon    src 
    #Should Be Equal   ${page_icon}   http://localhost:3002/src/assets/github.png   

    ${page_value}=    Get Text    xpath://*[@id="root"]/div[1]/h2
    Should Be Equal    ${page_value}    github-search

    ${page_value}=    Get Text    xpath://*[@id="root"]/div[2]/h1
    Should Be Equal    ${page_value}    Search for a user

    ${page_value}=    Get Text    xpath://*[@id="root"]/div[3]/h2
    Should Be Equal    ${page_value}    made with 💜 by hedênica

    ${placeholder_value}=    Get Element Attribute     username     placeholder
    Should Be Equal   ${placeholder_value}     Type a github username 

    Element Should Be Focused     username

    Element Should Be Disabled    search

    # Close
    [Teardown]    Close Browser


User Search for Existing User
    # Arrange
    Open Browser To Initial Page
    
    # Act
    Input Username    cramosqa
    Capture Page Screenshot    existing_user_capture1_{index}.png
    Search
    Capture Page Screenshot    existing_user_capture2_{index}.png

    # Assert
    ${page_value}=    Get Text    xpath://*[@id="root"]/div[2]/h1
    ${user_value}=    Get Text    xpath://*[@id="root"]/div[2]/div[1]/div/p[1]
    Should Be Equal    ${page_value}    Look who we found 🔥
    Should Be Equal    ${user_value}    Name: Carla Ramos

    # Close
    [Teardown]    Close Browser


User Search for Non Existing User
    # Arrange
    Open Browser To Initial Page

    # Act
    Input Username    wimpykiddiary
    Capture Page Screenshot    non_existing_user_capture1_{index}.png
    Search
    Capture Page Screenshot    non_existing_user_capture2_{index}.png
   
    # Assert
    ${page_value}=    Get Text    xpath://*[@id="root"]/div[2]/h2
    Should Be Equal    ${page_value}    User wimpykiddiary not found in GitHub!
    
    # Close
    [Teardown]    Close Browser

User Search with Invalid User format
    # Arrange
    Open Browser To Initial Page
    
    # Act
    Input Username    askha#$%&/
    Capture Page Screenshot    invalid_user_format_capture1_{index}.png
    Search
    Capture Page Screenshot    invalid_user_format_capture2_{index}.png

    # Assert
    ${page_value}=    Get Text    xpath://*[@id="root"]/div[2]/h2
    Should Be Equal    ${page_value}    Invalid format for a GitHub User! Please insert only alphanumeric characters and dashes.
  
    # Close
    [Teardown]    Close Browser

User Search empty
    # Arrange
    Open Browser To Initial Page

    # Act
    Capture Page Screenshot    empty_user_capture1_{index}.png
    Search
    Capture Page Screenshot    empty_user_capture2_{index}.png

    # Assert
    ${page_value}=    Get Text    xpath://*[@id="root"]/div[2]/h2
    Should Be Equal    ${page_value}    Please insert a valid GitHub user. (alphanumeric characters and dashes)
 
    # Close
    [Teardown]    Close Browser


*** Keywords ***
Open Browser To Initial Page
    Open Browser    ${APP URL}    ${BROWSER}
    Title Should Be    Github User Search

Search Username
    [Arguments]    ${username}
    Input Text      username    ${username}
    Click Button    search
    Wait Until Element Is Visible    xpath://button[contains(text(), 'Return')]

Input Username
    [Arguments]    ${username}
    Input Text      username    ${username}

Search 
    Click Button    search
    Wait Until Element Is Visible    xpath://button[contains(text(), 'Return')]

