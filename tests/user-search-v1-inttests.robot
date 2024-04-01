*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://api.github.com

*** Test Cases ***
Get GitHub Existing User
    [Documentation]    Get information about a GitHub user
    ${username}=    Set Variable    cramosqa
    ${endpoint}=    Set Variable    ${BASE_URL}/users/${username}
    ${response}=    Get    ${endpoint}
    ${json}=    Set Variable    ${response.json()}

# Assert
    Run Keyword And Continue On Failure    Should Be Equal As Strings   ${response.status_code}     200
    ${name}=    Get From Dictionary    ${json}    name  => error
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${name}    Carla Ramos

Get GitHub Non-Existing User
    [Documentation]    Get information about a GitHub user
    ${username}=    Set Variable    hdfgsaljkfsagf
    ${endpoint}=    Set Variable    ${BASE_URL}/users/${username}
    ${response}=    Get    ${endpoint}

# Assert
    Run Keyword And Continue On Failure    Should Be Equal As Strings   ${response.status_code}      404
   