Part 1: Set Up Jenkins Jobs for Each Repository
Step 1: Create Separate Jenkins Freestyle Jobs
Navigate to Jenkins Dashboard:

Open Jenkins in your browser.
Create New Job for Python Repository:
Click "New Item" and enter the job name attendance-api-ci.
Select "Freestyle project" and click "OK".
Configure GitHub Repository:
In the "Source Code Management" section, select "Git".
Enter the repository URL: https://github.com/OT-MICROSERVICES/attendance-api.
Create New Job for GoLang Repository:
Repeat the steps above with the job name employee-api-ci.
Use the repository URL: https://github.com/OT-MICROSERVICES/employee-api.
Create New Job for Java Repository:
Repeat the steps above with the job name spring3hibernate-ci.
Use the repository URL: https://github.com/opstree/spring3hibernate.git.
------------------------------------------
Part 2: Implement CI Checks
Step 1: Credential Scanning
Install Credential Scanner Plugin:

Go to "Manage Jenkins" -> "Manage Plugins".

Select the "Available" tab and search for "Credential Scanner".

Install the plugin and restart Jenkins if prompted.

Configure Credential Scanner in Each Job:

In each job (attendance-api-ci, employee-api-ci, spring3hibernate-ci), go to the "Build" section.

Click "Add build step" and select "Execute Shell".

Add the command to scan for credentials:

sh
credentials-scan --repo .
Step 2: Unit Testing
Install Required Plugins:

For Python: Install "ShiningPanda" plugin for virtualenv support.

For GoLang: Install "Go Plugin".

For Java: Install "JUnit" plugin.

Configure Unit Tests in Each Job:

Python:

In the "Build" section, click "Add build step" and select "Execute Shell".

Add the commands to run unit tests:

sh
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
pytest --junitxml=results.xml
GoLang:

In the "Build" section, click "Add build step" and select "Execute Shell".

Add the commands to run unit tests:

sh
go test -v ./... > results.txt
Java:

In the "Build" section, click "Add build step" and select "Invoke top-level Maven targets".

Add the goal to run tests:

sh
test
-------------------------------------------------
Step 3: Code Coverage
Install Coverage Plugins:

For Python: Install "Cobertura" plugin.

For GoLang: Install "Go Coverage Plugin".

For Java: Cobertura plugin should cover both JUnit tests and code coverage.

Configure Code Coverage:

Python:

Modify the unit test step to include coverage:

sh
pip install coverage
coverage run -m pytest
coverage report -m
coverage xml -o coverage.xml
GoLang:

Add a build step to run coverage:

sh
go test -coverprofile=coverage.out
go tool cover -html=coverage.out -o coverage.html
Java:

Ensure Cobertura plugin is installed and configured to read cobertura.xml generated during tests.

Part 3: Store Reports and Manage Artifacts
Configure Jenkins to Store Reports:

In each job, go to the "Post-build Actions" section.

Add "Publish JUnit test result report".

Specify the path for test results (e.g., **/results.xml for Python).

Manage Artifacts:

In the "Post-build Actions" section, add "Archive the artifacts".

Specify the files to archive (e.g., coverage.xml, results.txt, coverage.html).

Part 4: Configure Notifications
Install Notification Plugins:

Go to "Manage Jenkins" -> "Manage Plugins".

Install "Email Extension Plugin", "Slack Notification Plugin", or "Telegram Notification Plugin" as needed.

Configure Email Notifications:

In each job, go to the "Post-build Actions" section.

Add "Email Notification".

Configure recipients and conditions for triggering emails.

Configure Slack Notifications:

Go to "Manage Jenkins" -> "Configure System".

Scroll to "Slack" and configure with your Slack workspace credentials.

In each job, go to the "Post-build Actions" section.

Add "Slack Notifications" and configure the conditions for triggering notifications.

By following these steps, you'll have a robust CI pipeline in Jenkins for each of your repositories with proper checks, report storage, artifact management, and failure notifications.