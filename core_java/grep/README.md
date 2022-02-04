# Introduction
The grep Java program will read all the files in the current directory and every directory below the current one looking in each file for the regular expression which was passed to be searched. The output is written to an output file in the root directory.
This program is written in Java (using Streams, Lambda, and RegEx pattern matching) with Maven as the build tool. It is configured to be run as a command line with the JRE installed or via a Docker container.
Technologies used in this project:
- JAVA (stream APIs,Collections and Regex)
- Docker
- Maven
- Github
- IntelliJ

# Quick Start
1. Run the application with docker
```
docker pull nazaninak/grep
docker run --rm -v `pwd`/data:/data -v `pwd`/out:/out nazaninak/grep [regex] [rootDirectory] [outFile]
```
2. Run the application with JAR file
```
java -cp target/grep-1.0-SNAPSHOT.jar ca.jrvs.apps.grep.JavaGrepImp [regex] [rootDirectory] [outfile]
```
#Implemenation
## Pseudocode
```
storedLines = []
for file in listFilesRecursively(rootDir)
  for fileLine in readLines(file)
      if matchesPattern(fileLine)
        storedLines.add(fileLine)
saveToFile(storedLines)
```
## Performance Issue
The performance issue of this program is that it reads the entire file into memory into an ArrayList. So, we need to have enough memory to store this array and then process it. We can optimize it by using a java.uil.Scanner to process the contents of the file and retrieve lines one by one. In this way we can reduce the amount of memory needed.

# Test
The application is tested by an instance file that includes lines of text (Shakespeare.txt). A string was then used to search this file to ensure it was returned correctly. This was compared with the egrep command to make sure it matched.

# Deployment
Application Dockerized by using Docker image. Creating docker file allows us to carry openjdk:8-alpine configurations that will copy from JAR file and creates entry point configurations.

# Improvement
The improvements can be done to this project are:
1. Implement the java.util.Scanner class to process the file as a stream and process each line one at a time.
2. Split the file into two parts and use parallel computing to process it.
