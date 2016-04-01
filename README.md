# __EDU__*SCOPE*


#### What you need to get started,
1. [XAMPP](https://www.apachefriends.org/index.html) (Apache server, MySQL) 
2. Git (for [Windows](https://git-scm.com/)) (Git is already installed on mac)

#### How to get the Project files? Clone the repo.
Once you have git, go to `XAMPP/htdocs/` and clone this repository by typing the command below 
and Enter your username and password on prompt
```git
git clone --depth 1 https://github.com/polltery/eduscope.git -b application
```

for further Git guide, check the [Google Document](https://docs.google.com/document/d/1WFO0DWCoO86QIkvxM8rCkrDsQb4n8picuUBBmO5Hvq4/edit)

#### Frontend Libraries in use, check the documentations for help
1. [Bootstrap](http://getbootstrap.com/components/)
2. [jQuery](https://jquery.com/)


#### Backend Setup (Please wait until the backend changes are made to the repo)
1. Once you have your MySQL and apache server running, in your web browser go to "localhost/eduscope/mysql_db_setup/db_initialize.php", this will create the database and all the tables

####Pending Tasks:
Visit [here](https://docs.google.com/spreadsheets/d/1Hrt0fGZgkDPiXamk6dQVy9HYFATJuRLJXBcWMy8kaJ4/edit#gid=1626178758) for a complete list of tasks

### Backend API Documentation for getInfo.php
getInfo is a common service script for all requests that replies with a JSON query based on the arguments provided, this scripts expects the user to be logged in, if the user is not logged in an error is sent to the client.

The script is used as getInfo.php?type=<TYPE>

**TYPE: list**

Alternatively, you can also get a list of things without concering the user id

getInfo.php?type=list&from=tableName

type : list | This will tell the script that you want a list of things

from : <table name> | This will be the table you would like to get 

**TYPE: profile**
You can also get info of another user by setting the type as profile and the user as the username of the profile
for example..

getInfo.php?type=profile&user=username

type : profile | This will tell the script to get profile details of a specified user

user : <username> | The user name to look at


**TYPE: relation**

You can check the relation between the user and the mentor (The user recieving the mentor request)
for example..

getInfo.php?type=relation&receiver=id

type : relation | This will tell the script to look for what relation the 2 user's have

receiver : <id> | The user_id of the reciever

Response is sent as..

RelationStatus : (0|1|2|3) | 
  2 means user is not a mentor
  1 means user is already mentor, 
  3 means request pending, 
  0 means user is sending request to self

relation : <string> | The message to be sent depending on the relation, 3 cases user sends to themselves, or the other user is already a mentor, or the other

user's request is pending, or the sending user is not linked with the receiving user.

oppositeRelationStatus : (0|1|2) | 
  0 : user is not related to them
  1 : user is the user who they mentor
  2 : user is a user who would like to be mentored and has sent a request

oppositeRelation : <string> | The string will be based on the relation status


**TYPE: mymentors**

This will retrive a list of mentors of the loggedin user

URL: getInfo.php?type=mymentors

RESPONSE: 

status : (0|1) | 0 for failure and 1 for success

mentors : <array> | An array of mentors containg JSON objects with properties
 - user_username
 - userDetail_firstName
 - userDetail_lastName

To access ith element, data.mentors[i].<property>
 
**TYPE: myusers**

This will retrive a list of users metored by the loggedin user

URL: getInfo.php?type=myusers

RESPONSE: 

status : (0|1) | 0 for failure and 1 for success

mentors : <array> | An array of users containg JSON objects with properties
 - user_username
 - userDetail_firstName
 - userDetail_lastName

To access ith element, data.users[i].<property>


**TYPE: myrequests**

This will give a list of users that have sent the logged in user a mentor request.

URL: getInfo.php?type=myrequests

RESPONSE:

status : (0|1) | 0 for failure and 1 for success

requests : <array> | An array of users containg JSON objects with properties
  - user_username
  - userDetail_firstName
  - userDetail_lastName

To access ith element, data.requests[i].<property>

**TYPE:myquals**

This will give a list of school and uni qualification that the user has in 2 different arrays

URL: getInfo.php?type=myquals

RESPONSE:

status: (0|1) | 0 for failure and 1 for success

school: <array> | An array of school qualifications
  - school_name
  - grad_year
  - qualification

school_subs: <array> | An array of subjects the user did in school
  - qualification
  - subject_name
  - score

uni: <array> | An array of university qualifications
  - uni_name
  - name | name of the qualification
  - short_title
  - type
  - subject_name
  - grad_year

To access the ith element in JS, use data.school[i].id or data.uni[i].id

**TYPE:myscores**

This will give score for the user's subjects to know where his acadmeic strength is

URL: getInfo.php?type=myscores

RESPONSE:

status: (0|1) | 0 for failure and 1 for success

scores: <array> | An array of scores for the subjects including most of the data
  - subject_name
  - score | the ucas score
  - universities | no. universities the user has attended for this specific subject
  - jobs | no. of jobs done by the user related to that subject

### Documentation for getting resources from getResource.php
Purpose of this script to static database data to the frontend in the form of JSON

Usage: getResource.php?type=<type>

Where <type> can be the following:

**subjects**
  
  Response key:Description

  status:Status code, 0 for fail (passed along with error), 1 for success

  subjects[]: A list of subjects from the database

**universities**
  
  Response key:Description
  
  status:Status code, 0 for fail (passed along with error), 1 for success
  
  universities[]:A list of universities from the database

**quaifications**
  
  Response key:Description
  
  status:Status code, 0 for fail (passed along with error), 1 for success
  
  qualifications[]:A list of universities from the database

**qualification-types**
  
  status
  
  qualification-types[]:A list of qualification types (eg. bachelors, masters, phD, etc)
