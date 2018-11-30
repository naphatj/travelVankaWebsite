This 6-person project is part of database design course at chulalongkorn university 2018.
The main goal of the project is to design and create a relational database using MySQL.
The additional part is to create a website that can do basic interactions with the database (add,update,delete,search).
Most content of this repository is for the website that our group develop including client(front-end using REACT) and server (NODEJS).
It also contains sql script for creating the database and inserting contents into tables.
Since, the project objectives focus mostly on the database part. The website developing and network system wasn't taught in the course.
It was hard for our group because no one in our group've had any experince before.But we managed to accomplished it and we learned a lot from doing so but the website is still not completed such as no proper error handling.


### Please read the projectReport.pdf 
The project Report contains the overview of the project including the project background, more detail and example screenshots from the website and the database.

#### What did I do?
This is a part of a six-person group project. I was assigned mostly to do the SQL database part. I created the SQL script and tests for queires. But I also participated for moderate parts of the website developing including helping to connects a front-end client(REACT) to the back-end(server.js) and connecting server.js to the database and how it recieve input from front-end and use that to process SQL querries. 

#### What did I learn?
In this project, I learned about database design (relational), I get to learn how to use tools (MySQL), SQL scripts and even though I didn't focus mainly on the website, I still learned a lot of basic aspects of website and network such as get/post requests, node js,react, npm commands, sending input from front-end to back-end, SQL injection and using SQL prepared statement to prevent SQL injection.



-----------------------------------------------------------------------------------------------------------------------
# How to initiate React Front-end and NodeJS Back-end
-----------------------------------------------------------------------------------------------------------------------
# TravelVanka Website
with Concurrently running front-back ends

 **go to tvk-master**
 
**npm install**
 
**npm run install-client**

**npm run install-server**

 -----------------------------------------------------
 
**to start React and server**

 **npm run dev**    :   run both client and server concurrently
 
 
 
 **npm run client**     :  run only client
 
 
 **npm run server**     :run only server
 
  -----------------------------------------------------

 check package.json for more script details
 
 
 if missing modules :
 
 npm install -g concurrently nodemon mysql express 

