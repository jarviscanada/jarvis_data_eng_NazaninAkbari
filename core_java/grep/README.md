# Introduction


# Quick Start
1. Run the application with docker

2. Run the application with JAR file

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
(30-60 words)
Discuss the memory issue and how would you fix it

# Test
How did you test your application manually? (e.g. prepare sample data, run some test cases manually, compare result)

# Deployment
How you dockerize your app for easier distribution?

# Improvement
List three things you can improve in this project.