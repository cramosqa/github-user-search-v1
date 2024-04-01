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

# Test Plan

## Project Name: [GitHub User Search]

## Version: [v1]

## Table of Contents

1. [Introduction](#introduction)
2. [Objectives](#objectives)
3. [Scope](#scope)
4. [Roles and Responsibilities](#roles-and-responsibilities)
5. [Test Environment](#test-environment)
6. [Test Strategy](#test-strategy)
7. [Test Cases](#test-cases)
8. [Test Execution](#test-execution)
9. [Test Reporting](#test-reporting)
10. [Test Closure](#test-closure)

---

## 1. Introduction

This project provides a Web page that allows user search for a GitHub user name and retrieves the following user information:

- Photo
- Name
- Number of repositories
- Repositories list: Path, description

## 2. Objectives

Ensure the GitHub User Search Web Page functions correctly by accurately retrieving user data from the GitHub database based on user input.

## 3. Scope

This test plan covers the functionality and usability of the GitHub User Search.

## 4. Roles and Responsibilities

Testers: Responsible for executing the test cases and reporting any issues.
Developers: Responsible for fixing reported issues and enhancing the functionality as required.

## 5. Test Environment

### Software Configuration:

#### Operating System:

Windows.

#### Development Tools:

Node.js: Required for running Node.js applications. Install the LTS version.
IDE: Any preferred text editor or IDE such as Visual Studio Code, Sublime Text, or Atom.
Git: Version control system for managing source code.
Package Manager: npm or Yarn for managing dependencies.

#### Testing Tools

Robot Framework
Selenium
Mobile simulator - responsive testing tool Chrome Extension

#### Browser Drivers:

For Selenium with Robot Framework, was used Selenium WebDriver executable for Chrome.
WebDriver executables must be added to the system PATH.

#### Dependencies:

Libraries: Install Robot Framework and SeleniumLibrary using pip.
Project Dependencies: Install dependencies required for your Node.js and React project using npm or Yarn.
Network Configuration:

#### Internet Access:

Ensure that the test environment has internet access to download dependencies, access external resources (if required for testing), and communicate with remote WebDriver servers.

#### Firewall and Proxy Settings:

Configure firewall settings to allow communication with WebDriver servers and necessary external resources.
Configure proxy settings if the test environment requires access to the internet through a proxy server.

#### Network Isolation:

Depending on security requirements, isolate the test environment from production and staging environments to prevent accidental data corruption or leakage.

## 6. Test Strategy

### Functional Tests:

Test the functional requirements of the application.
Verify that the user can input a GitHub username, submit the form, and receive relevant information about the user from the GitHub database.

Manual testing using Mobile simulator.

### User Interface (UI) Tests:

Test the appearance and usability of the web page.
Ensure that UI elements are correctly displayed and responsive across various screen sizes and devices.
Validate that the UI follows design guidelines and is intuitive for users to interact with.

tests\user-search-v1-tests.robot

### End-to-End (E2E) Tests:

Test the entire application flow from user input to displaying results on the page.
Use automated testing tools to simulate real user interactions and verify expected behavior.
Validate that the application behaves correctly across different browsers and devices.

tests\user-search-v1-tests.robot

### Integration Tests:

Test the interaction between different components, including frontend UI, backend API, and external services like the GitHub API.
Ensure that components work together as intended and handle data flow correctly.

tests\user-search-v1-inttests.robot

### Unit Tests:

Test individual components, functions, or modules of the frontend codebase.
Verify that each function behaves as expected in isolation.
Mock dependencies such as API calls to simulate different scenarios.

TBD

### Performance Tests:

Measure the performance of the web page under different conditions.
Test the response time of search requests to the GitHub API.
Verify that the page loads quickly and remains responsive, even under heavy load.

TBD

### Security Tests:

Test for vulnerabilities such as injection attacks, cross-site scripting (XSS), and cross-site request forgery (CSRF).
Ensure that sensitive data, such as access tokens, is handled securely.
Validate that input validation and sanitization are effective in preventing malicious input.

tests\user-search-v1-tests.robot

### Accessibility Tests:

Ensure that the web page is accessible to users with disabilities.
Test for compliance with accessibility standards such as WCAG (Web Content Accessibility Guidelines).
Verify that assistive technologies can interpret and interact with the page's content effectively.

TBD

### Regression Tests:

Re-run previously executed tests to ensure that recent code changes have not introduced new bugs or regressions.
Maintain a suite of regression tests to cover critical functionalities and edge cases.
Cross-Browser and Cross-Device Tests:
Test the web page's compatibility across different web browsers (e.g., Chrome, Firefox, Safari, Edge).
Validate that the page renders correctly and functions as expected on various devices (e.g., desktop, tablet, mobile).

tests\user-search-v1-tests.robot
Mobile simulator

## 7. Test Cases

### A. User Interface

UI Layout Test: Verify that the UI elements (input field, search button) are displayed correctly.
Responsiveness Test: Ensure the UI adapts to different screen sizes (desktop, tablet, mobile).
Input Validation Test: Check if the input field accepts valid GitHub usernames only.

**GitHub usernames:**

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

### B. Functionality

User Search Test: Enter a valid GitHub username and verify that the corresponding user data is retrieved and displayed correctly.

Empty Search Test: Leave the input field empty and ensure an appropriate message is displayed.

Non-existent User Test: Enter a GitHub username that does not exist and verify that a relevant message is displayed.

Search Button Functionality Test: Verify that pressing the search button triggers the search action.

Loading Indicator Test: Verify that a loading indicator is displayed while user data is being fetched from the server.

### C. Performance

Response Time Test: Measure the time taken to retrieve user data for different scenarios (e.g., existing user, non-existent user).

Load Testing: Simulate heavy traffic by sending multiple concurrent search requests and ensure the system handles them without crashing or slowing down significantly.

### D. Security

Input Sanitization Test: Verify that the input is properly sanitized to prevent injection attacks.

Data Privacy Test: Ensure that sensitive user data is not exposed in the search results.

## 8. Test Execution

Perform manual testing based on the test cases outlined above.

Execute tests\user-search-v1-tests.robot

Record any issues encountered during testing along with steps to reproduce them.

## 9. Test Reporting

Robot Framework returns three result files: output, log and report.

## 10. Test Closure

Outline the process for closing out the testing effort, including reviewing test results, addressing defects, and obtaining sign-off.

Review the test results with the development team and address any unresolved issues.

Obtain sign-off from relevant stakeholders once all issues are resolved and the system is deemed ready for deployment.
