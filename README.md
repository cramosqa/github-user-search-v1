<h1 align="center"> Github User Search </h1> <br>

<div align="center">
<img src="./src/assets/github/github-search-user.png" />
</div>

## Introduction

This is a basic project that search for a user on github and then returns a few of the user data and it's repositories's names and descriptions.

## Demo

https://user-images.githubusercontent.com/56850413/165952437-1cba04ef-4b68-4f3c-86aa-c69f70086a2d.mp4

## How to get up and running

Clone or download the repo

- `yarn` to install dependencies
- `yarn dev` to run the project in development mode

## How to commit into this repo?

- `git commit` since this repo uses husky and cli commitlint, a frindly cli will appear to help you commit a clear message

## Disclaimer

The github api is public and it has a limit of 60 request for a unauthenticated user

---

## Test Plan

### Project Name: GitHub User Search

### Version: [v1]

### Table of Contents

1. [Summary](#1)
2. [Objectives](#2)
3. [Scope](#3)
4. [Roles and Responsibilities](#4)
5. [Test Environment](#5)
6. [Test Strategy](#6)
7. [Test Cases](#7)
8. [Test Execution](#8)
9. [Test Reporting](#9)
10. [Test Closure](#10)

### 1. Summary

This project provides a Web page that allows user search for a GitHub user name and retrieves the following user information:
- Photo
- Name
- Number of repositories 
- Repositories list: Path, description

### 2. Objectives

Ensure the GitHub User Search Web Page functions correctly by accurately retrieving user data from the GitHub database based on user input.

### 3. Scope

This test plan covers the functionality and usability of the GitHub User Search.

### 4. Roles and Responsibilities

<u>Testers</u>: Responsible for executing the test cases and reporting any issues.

<u>Developers</u>: Responsible for fixing reported issues and enhancing the functionality as required.

### 5. Test Environment

#### 5.1 Software Configuration

##### 5.1.1 Operating System

- Windows: Windows 7, Windows 8, Windows 10, and Windows Server editions.

- macOS: macOS Mojave, macOS Catalina, and macOS Big Sur.

- Linux: distributions like Ubuntu, CentOS, Fedora, and others.

##### 5.1.2 Development Tools

<u>Node.js</u>: Required for running Node.js applications. Install the LTS version.

<u>IDE</u>: Any preferred text editor or IDE such as Visual Studio Code, Sublime Text, or Atom.

<u>Git</u>: Version control system for managing source code.

<u>Package Manager</u>: npm or Yarn for managing dependencies.

##### 5.1.3 Testing Tools

[Robot Framework](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)

Robot Framework is a Python-based, extensible keyword-driven automation framework for acceptance testing, acceptance test driven development (ATDD), behavior driven development (BDD) and robotic process automation (RPA).   
It can be used in distributed, heterogeneous environments, where automation requires using different technologies and interfaces.
   
To install Robot Framework type `pip install robotframework` in your command-line interface

[Selenium library](https://robotframework.org/SeleniumLibrary/)

   This library allows Robot Framework to interact with web browsers.

   To install Selenium library type `pip install robotframework-seleniumlibrary` in your command-line interface

[Requests library](https://pypi.org/project/requests/)

   This library simplifies making HTTP requests and handling responses

   To install Requests library type `pip install requests` in your command-line interface

Browser Drivers 

   Allows Selenium to interact with web browsers.

   Download drivers for the browsers you want to test with

   - ChromeDriver: For Google Chrome
   - GeckoDriver: For Mozilla Firefox
   - WebDriver for Safari: For Safari
   - EdgeDriver: For Microsoft Edge  

[Mobile simulator](https://chromewebstore.google.com/detail/mobile-simulator-responsi/ckejmhbmlajgoklhgbapkiccekfoccmk) 
   
Responsive testing tool Chrome Extension

##### 5.1.4 Internet Access

Ensure that the test environment has internet access to download dependencies, access external resources (if required for testing), and communicate with remote WebDriver servers.

##### 5.1.5 Firewall and Proxy Settings

Configure firewall settings to allow communication with WebDriver servers and necessary external resources.

Configure proxy settings if the test environment requires access to the internet through a proxy server.

##### 5.1.6 Network Isolation

Depending on security requirements, isolate the test environment from production and staging environments to prevent accidental data corruption or leakage.

### 6. Test Strategy

#### 6.1 Functional Tests

Strategy - Manual testing using Browser

- Test the functional requirements of the application.
- Verify that the user can input a GitHub username, submit the form, and receive relevant information about the user from the GitHub database.

#### 6.2 User Interface (UI) Tests

Strategy - Automated tests

- Test the appearance and usability of the web page.
- Ensure that UI elements are correctly displayed and responsive across various screen sizes and devices.
- Validate that the UI follows design guidelines and is intuitive for users to interact with.

#### 6.3 End-to-End (E2E) Tests

Strategy - Automated tests

- Test the entire application flow from user input to displaying results on the page.
- Use automated testing tools to simulate real user interactions and verify expected behavior.
- Validate that the application behaves correctly across different browsers and devices.

#### 6.4 Integration Tests

Strategy - Automated tests

- Test the interaction between different components, including frontend UI, backend API, and external services like the GitHub API.
- Ensure that components work together as intended and handle data flow correctly.

#### 6.5 Unit Tests

Strategy - Automated tests

- Test individual components, functions, or modules of the frontend codebase.
- Verify that each function behaves as expected in isolation.
- Mock dependencies such as API calls to simulate different scenarios.

#### 6.6 Performance Tests

Strategy - Automated tests

- Measure the performance of the web page under different conditions.
- Test the response time of search requests to the GitHub API.
- Verify that the page loads quickly and remains responsive, even under heavy load.

#### 6.7 Security Tests

Strategy - Automated tests

- Test for vulnerabilities such as injection attacks, cross-site scripting (XSS), and cross-site request forgery (CSRF).
- Ensure that sensitive data, such as access tokens, is handled securely.
- Validate that input validation and sanitization are effective in preventing malicious input.

#### 6.8 Accessibility Tests

Strategy - Automated tests

- Ensure that the web page is accessible to users with disabilities.
- Test for compliance with accessibility standards such as WCAG (Web Content Accessibility Guidelines).
- Verify that assistive technologies can interpret and interact with the page's content effectively.

#### 6.9 Regression Tests:

Strategy - Automated tests

- Re-run previously executed tests to ensure that recent code changes have not introduced new bugs or regressions.
- Maintain a suite of regression tests to cover critical functionalities and edge cases.

#### 6.10 Cross-Browser and Cross-Device Tests

Strategy - Manual testing use Mobile Simulator extensions

- Test the web page's compatibility across different web browsers (e.g., Chrome, Firefox, Safari, Edge).

-Validate that the page renders correctly and functions as expected on various devices (e.g., desktop, tablet, mobile).

### 7. Test Cases

#### 7.1 User Interface


| Test | Case |
| ---------------------------- | -------------------------------------------------------------- |
| UI Layout | Verify that the UI elements (input field, search button) are displayed correctly |
| Responsiveness | Ensure the UI adapts to different screen sizes (desktop, tablet, mobile) |
| Input Validation | Check if the input field accepts valid GitHub usernames only |


**GitHub usernames requirements:**

_Allowed Characters:_

GitHub usernames can contain alphanumeric characters (letters and numbers), hyphens ("-"), and underscores ("\_").
They cannot contain spaces or any other special characters.

_Length:_
Usernames must be at least one character long.
They can be up to 39 characters long.

_Case Sensitivity:_  
Usernames are case-insensitive. However, GitHub will display the username exactly as it was entered during registration.

_Reserved Names:_  
Usernames cannot be in use by another GitHub user.
They cannot be reserved words, such as "admin" or "root".

_Initial Character:_
Usernames must start with an alphanumeric character.
They cannot start with a hyphen or underscore.

_Consecutive Dashes:_
Usernames cannot contain consecutive hyphens.
For example, "user--name" is not allowed.

_Underscores and Dashes:_
Usernames can contain both underscores and hyphens, but they cannot start or end with these characters.
For example, "-username" or "username-" are not allowed.

_Restrictions:_
GitHub may restrict certain usernames that violate its terms of service, such as impersonation, trademark violations, or offensive content.
Error Handling Test: Verify appropriate error messages are displayed for invalid inputs or server errors.

#### 7.2 Functionality

| Test | Case |
| ---------------------------- | -------------------------------------------------------------- |
| User Search | Enter a valid GitHub username and verify that the corresponding user data is retrieved and displayed correctly |
| Empty Search | Leave the input field empty and ensure an appropriate message is displayed |
| Non-existent User | Enter a GitHub username that does not exist and verify that a relevant message is displayed |
|Search Button Functionality | Verify that pressing the search button triggers the search action|
| Loading Indicator | Verify that a loading indicator is displayed while user data is being fetched from the server

#### 7.3 Performance

| Test | Case |
| ---------------------------- | -------------------------------------------------------------- |
| Response Time | Measure the time taken to retrieve user data for different scenarios (e.g., existing user, non-existent user) |
| Load Testing | Simulate heavy traffic by sending multiple concurrent search requests and ensure the system handles them without crashing or slowing down significantly |

#### 7.4 Security

| Test | Case |
| ---------------------------- | -------------------------------------------------------------- |
| Input Sanitization |  Verify that the input is properly sanitized to prevent injection attacks |
| Data Privacy | Ensure that sensitive user data is not exposed in the search results |

### 8. Test Execution

1. Manual testing based on the test cases outlined above

2. Run automated tests:
   - Open a command prompt or terminal and navigate to the directory where automated tests file is located (project name\tests)
   - Execute the following command: `robot file_name`
     - for E2E tests: replace file_name by **user-search-v1-tests.robot** ;
     - for integration tests: replace file_name by **user-search-v1-inttests.robot**

### 9. Test Reporting

After the tests have completed, Robot Framework will generate the following output files: 
 - `projectname\results\report.html` - test suite results overview 
 - `projectname\results\log.html` - test suite detailed results 
 - `projectname\results\output.xml`

It's possible to export failed tests to create Trello or Jira cards (not done).

## 10. Test Closure 

Outline the process for closing out the testing effort, including reviewing test results, addressing defects, and obtaining sign-off.

Review the test results with the development team and address any unresolved issues.

Obtain sign-off from relevant stakeholders once all issues are resolved and the system is deemed ready for deployment.
