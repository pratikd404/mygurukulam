Part 1: Creating Jenkins Jobs with Job DSL
Step 1: Install Job DSL Plugin
Open Jenkins in your browser.

Go to "Manage Jenkins" -> "Manage Plugins".

Select the "Available" tab and search for "Job DSL".

Install the "Job DSL" plugin and restart Jenkins if prompted.
-------------------------------------------------------------------
Step 2: Create Job DSL Script
Go to "New Item" to create a new job.
Select "Freestyle Project" and name it "job-dsl-script".
In the job configuration, go to the "Build" section.
Click "Add build step" and select "Process Job DSLs".
This time, choose "Look on Filesystem" and specify a file path within the workspace (e.g., dsl-scripts/jenkins-jobs.groovy).
Step 3: Create the DSL Script File
Go to the Jenkins workspace directory on your server (e.g., /var/lib/jenkins/workspace/job-dsl-script).

Create a directory named dsl-scripts within the workspace.

Inside the dsl-scripts directory, create a file named jenkins-jobs.groovy.

Open jenkins-jobs.groovy and paste the following script:

--------------------------------------------------------
def roles = ['dev', 'test', 'devops']
def jobCount = 3

roles.each { role ->
    (1..jobCount).each { index ->
        job("${role}-${index}") {
            steps {
                shell("echo 'Job Name: ${role}-${index}, Build Number: \${BUILD_NUMBER}'")
            }
        }
    }
}
---------------------------------------------------------
Save the file.

Step 4: Run the Job
Go back to Jenkins and build the "job-dsl-script" job again. 
Check the console output to ensure the jobs are created successfully.
-------------------------------------------------------------------------------

fir se agr fail hui kuch ERROR: script not yet approved for use
Do the below steps:
Step -1 
Review and Approve the Script
Go to "Manage Jenkins".
Look for "In-process Script Approval" under "Security".
You should see your jenkins_jobs.groovy script listed there.
Click "Approve" next to the script.
Step 2: Run the Job Again
---------------------------------------------------------------------------------
Step 3: Configure Roles and Assign Permissions
Install Role-Based Authorization Strategy Plugin (if not already installed)

Go to "Manage Jenkins" -> "Manage Plugins".

Select the "Available" tab and search for "Role-Based Authorization Strategy".

Install the plugin and restart Jenkins if prompted.

Manage Roles
Go to "Manage Jenkins" -> "Manage and Assign Roles" -> "Manage Roles".
Create the following roles and assign permissions:

Developer Role:
Overall: Read
Job: Build, Configure, Read, Workspace

Testing Role:
Overall: Read
Job: Build, Configure, Read, Workspace
Job: (dev jobs) Read

DevOps Role:
Overall: Read
Job: Build, Configure, Read, Workspace

Job: (dev jobs) Read
Job: (test jobs) Read
Admin Role:
Overall: Administer
--------------------------------------------------------------
Steps to Assign Permissions to the Developer Role
Add the Developer Role:

In the "Manage Roles" section, under "Role Name", type developer and click "Add".
now no need t build the Job
-------------------------------------------------------------------------------



Part 3: Enable SSO with Google
Navigate to "Manage Jenkins": and add the plugin Google Login and restart the jenkins
Step 2: Register Your Jenkins Instance in Google Developer Console
Open Google Developer Console:

Go to Google Developer Console.

Create a New Project:

Click on the project dropdown at the top and select "New Project".

Enter a project name (e.g., "Jenkins SSO") and click "Create".

Enable OAuth Consent Screen:

Navigate to "OAuth consent screen" from the left menu.

Select "External" for user type and click "Create".

Fill out the required fields such as app name, user support email, developer contact information, and click "Save and Continue".
Create OAuth 2.0 Credentials:

Go to "Credentials" from the left menu.

Click "Create Credentials" and select "OAuth 2.0 Client IDs".

Choose "Web application" as the application type.

Add authorized redirect URIs:

Add your Jenkins URL followed by /securityRealm/finishLogin (e.g., https://your-jenkins-url/securityRealm/finishLogin).

Click "Create".


-------------->Save Client ID and Client Secret:

You will be provided with a Client ID and Client Secret. Save these as you will need them in Jenkins configuration.


Final Step 3: Configure Google OAuth in Jenkins
Open Jenkins Configuration:
Navigate to "Manage Jenkins". 

SSO krte time pr
manage jenkins me jakr security me jakr first option h Authentication us pr click krke krna h
Step 3: Configure Global Security in Jenkin ----iska h upr ka ...Configure Global Securityye nam ka kuch nhi h 

