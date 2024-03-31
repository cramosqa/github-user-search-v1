*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${APP URL}    http://localhost:3000/
${BROWSER}    headlesschrome

*** Test Cases ***

UI Search Page
    [Documentation]  Verify Search page UI according to UX design
    [Tags]    UI

    # Arranje
    Open Browser To Initial Page

    # Assert
    #${page_icon}=     Get Element Attribute      github-icon    src 
    #Run Keyword And Continue On Failure     Should Be Equal   ${page_icon}   http://localhost:3002/src/assets/github.png   

    ${page_value}=    Get Text    xpath://*[@id="root"]/div[1]/h2
    Run Keyword And Continue On Failure     Should Be Equal    ${page_value}    github-search
 
    ${page_value}=    Get Text    xpath://*[@id="root"]/div[2]/h1
    Run Keyword And Continue On Failure    Should Be Equal    ${page_value}    Search for a user
 
    ${page_value}=    Get Text    xpath://*[@id="root"]/div[3]/h2
    Run Keyword And Continue On Failure    Should Be Equal    ${page_value}    made with 💜 by hedênica
 
    ${placeholder_value}=     Get Element Attribute     inputUser    placeholder
    Run Keyword And Continue On Failure     Should Be Equal   ${placeholder_value}     Type a github username 

    Run Keyword And Continue On Failure     Element Should Be Focused     inputUser

    Run Keyword And Continue On Failure     Element Should Be Disabled    searchBtn

    # Close
    [Teardown]    Close Browser    



UI User Page
    [Documentation]  Verify User page UI according to UX design, add more conditions to validate data
    [Tags]    UI

    # Arranje
    Open Browser To Initial Page

    # Act
    Input Username    cramosqa
    Search
    Wait
  
    # Assert
    #${page_icon}=     Get Element Attribute      github-icon    src 
    #Should Be Equal   ${page_icon}   http://localhost:3002/src/assets/github.png   

    ${page_value}=    Get Text    xpath://*[@id="root"]/div[1]/h2
    Run Keyword And Continue On Failure    Should Be Equal    ${page_value}    github-search
 
    ${page_value}=    Get Text    xpath://*[@id="root"]/div[2]/h1
    Run Keyword And Continue On Failure    Should Be Equal    ${page_value}    Look who we found 🔥
 
    ${page_value}=    Get Text    xpath://*[@id="root"]/div[3]/h2
    Run Keyword And Continue On Failure    Should Be Equal    ${page_value}    made with 💜 by hedênica
 
    #Run Keyword And Continue On Failure   Element Should Be Focused     returnBtn

    # Close
    [Teardown]    Close Browser


User Search with Invalid User format
    [Documentation]  Check if the input field accepts valid GitHub usernames only and verify if appropriate error messages are displayed, add contitions to validate github users constraints.
    [Tags]    UI

    # Arrange
    Open Browser To Initial Page
    
    # Act
    Input Username    askha#$%&/
    Search
    Wait

    # Assert
    ${page_value}=    Get Text    xpath://*[@id="root"]/div[2]/h2
    Run Keyword And Continue On Failure    Should Be Equal    ${page_value}    Invalid format for a GitHub User! Please insert only alphanumeric characters and dashes.
  
    # Close
    [Teardown]    Close Browser



Existing User Test
    [Documentation]    Enter a valid GitHub username and verify that the corresponding user data is retrieved and displayed correctly. 
    ...                Verify that pressing the search button triggers the search action.
    [Tags]    Functional

    # Arrange
    Open Browser To Initial Page
    
    # Act
    Input Username    cramosqa
    Search
    Wait
   
    # Assert
    ${page_value}=    Get Text    xpath://*[@id="root"]/div[2]/h1
    Run Keyword And Continue On Failure    Should Be Equal    ${page_value}    Look who we found 🔥
    ${user_value}=    Get Text    xpath://*[@id="root"]/div[2]/div[1]/div/p[1]
    Run Keyword And Continue On Failure    Should Be Equal    ${user_value}    Name: Carla Ramos

    # Close
    [Teardown]    Close Browser

Empty Search Test
    [Documentation]  Input empty field and verify if appropriate error messages are displayed.
    [Tags]    Functional

    # Arrange
    Open Browser To Initial Page
    Set Focus To Element    inputUser
 
    # Act
    Search

    # Assert
    Run Keyword And Continue On Failure     Element Should Be Disabled    searchBtn

    # Close
    [Teardown]    Close Browser

Non-existent User Test
    [Documentation]  Enter a non existent GitHub username and verify if error message is correct. Verify that pressing the search button triggers the search action.
    [Tags]    Functional

    # Arrange
    Open Browser To Initial Page

    # Act
    Input Username    wimpykiddiary
    Search
     
    # Assert
    ${page_value}=    Get Text    xpath://*[@id="root"]/div[2]/h2
    Run Keyword And Continue On Failure    Should Be Equal    ${page_value}    User wimpykiddiary not found in GitHub!
    
    # Close
    [Teardown]    Close Browser

Spinner Test
    [Documentation]  Verify that a loading indicator is displayed while user data is being fetched from the server.
    [Tags]    Functional

    # Arrange
    Open Browser To Initial Page

    # Act
    Input Username    cramosqa
    Search

    # Verify that the spinner is not visible
    #Element Should Be Visible  id=spinner
  
    # Verify that the spinner is not visible
    #Element Should Not Be Visible     id=spinner
    
    # Close
    [Teardown]    Close Browser

User Search Security 1.1
    [Documentation]  Verify security breaches
    [Tags]    Security

    # Arrange
    Open Browser To Initial Page
    
    # Act
    Input Username     "admin' OR '1'='1'"
    Search
    Run Keyword And Continue On Failure     Element Should Be Disabled    searchBtn
    ${page_value}=    Get Text    xpath://*[@id="root"]/div[2]/h2
    Run Keyword And Continue On Failure    Should Be Equal    ${page_value}    Invalid format for a GitHub User! Please insert only alphanumeric characters and dashes.

    # Close
    [Teardown]    Close Browser

 User Search Security 1.2  
 ...  [Documentation]  Verify security breaches
    [Tags]    Security 

    # Arrange
    Open Browser To Initial Page


    # Act
    Input Username     <script>alert('XSS attack!');</script>
    Search
    # Assert 
    Run Keyword And Continue On Failure     Element Should Be Disabled    searchBtn
    ${page_value}=    Get Text    xpath://*[@id="root"]/div[2]/h2
    Run Keyword And Continue On Failure    Should Be Equal    ${page_value}    Invalid format for a GitHub User! Please insert only alphanumeric characters and dashes.
      
    # Close
    [Teardown]    Close Browser

User Search Security 1.3   
    [Documentation]  Verify security breaches
    [Tags]    Security 
    # Arrange
    Open Browser To Initial Page

    # Act
    Input Username      fgsaelfiyfhsdfjhsfsjdchvsdjchsdbvkdfh gkjdfafkj sdhkjkfjfkjssdfdjkdgdsfgsdjkfgsdhfgjksdfghsdkjfgsdhgjksdfghskdjfghdfcb sdkfhsadkfsdfkadfdkfskdfskjdf
    Search

    # Assert 
    Run Keyword And Continue On Failure     Element Should Be Disabled    searchBtn
    ${page_value}=    Get Text    xpath://*[@id="root"]/div[2]/h2
    Run Keyword And Continue On Failure    Should Be Equal    ${page_value}    Invalid format for a GitHub User! Please insert only alphanumeric characters and dashes.
      
    # Close
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Initial Page
    Open Browser    ${APP URL}    ${BROWSER}
    Title Should Be    Github User Search
    #Capture Page Screenshot    page_usability_capture1_{index}.png

Input Username
    [Arguments]    ${username}
    Input Text      inputUser   ${username}

Search 
    Click Button    searchBtn
Wait
    Wait Until Element Is Visible    returnBtn
