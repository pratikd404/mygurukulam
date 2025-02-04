Ansible Assignment 1--------Done
Complete the following steps with the help of ansible modules:

UserManager:
Add NinjaTeam (Simulate Group) ex: team1
Add a User (Simulate) under a team ex: Nitish added to team1 Ensure below constraints are met:
A user should have read,write, execute access to home directory
All the users of same team should have read and excute access to home directory of fellow team members.
In home directory of every user there should be 2 shared directories
Team: Same team members will have full access
Ninja: All ninja's will have full access
Additional Features:

Change user Shell
Change user password
Delete user
Delete Group
List user or Team
------------------------------------------------------------------------------
Ansible Assignment-2(in which log rotation will use)

Install nginx in your servers(more then 2) and make sure the log files of nginx should not be granted more than 1 GB space on the nodes
Create equal number of websites as per your team  members and every members website should be hosted for only 2 hours and after every 2 hours another website should start displaying.
    - First 2 hours <team>.opstree.com should display content of tanya website
    - Next 2 hours <team>.opstree.com should display content of Heena website

Install Apache
Also Configure nginx to run as reverse proxy to apache after completing first point individually.


- Run the ansible commands in such a way that workers nodes are updated one by one and not altogether and also make sure using all type of strategies.
-----------------------------------------------------------------------------------
Ansile Assignment-3
Setup an entire infra using ansible playbook on aws
Setup Spring3HibernateApp (https://github.com/opstree/spring3hibernate) on created infra using ansible playbook by following the below steps:
Install MySQL
Create the war file for Spring3HibernateApp using maven
Install JDK 11
Install Tomcat
Send the war file created earlier to path "/opt/tomcat/apache-tomcat-7.0.108/webapps/"
Restart tomcat service
(edited)
opstree/spring3hibernate
A java loaded application for various testing purpose
Website
https://opstree.github.io
-------------------------------------------------------------------------------------