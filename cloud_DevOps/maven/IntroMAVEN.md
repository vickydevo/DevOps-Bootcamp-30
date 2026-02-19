# Maven and Automation Tools  

## 1. Introduction to Build Automation  
Build automation is the process of automating various steps in the software development lifecycle, such as compiling code, running tests, packaging software, and deploying it. This automation ensures consistency, reduces errors, and speeds up the development process by providing faster feedback to developers.  


## 2. What is Maven?  
Maven is a powerful build automation tool used mainly for Java projects. It simplifies the build process by managing project dependencies, compiling source code, packaging binaries, running tests, and generating documentation. Maven follows the convention-over-configuration principle, which means it promotes standard practices while allowing customization where needed.  

## 3. Artifacts  
In the context of build automation, an artifact is any file or set of files produced as a result of the build process. Artifacts include:  
- **Executable Files**: Programs that can be run by the operating system (e.g., `.exe` files).  
- **Libraries**: Reusable compiled code (e.g., `.dll`, `.jar` files).  
- **Archives**: Bundled and compressed collections of files (e.g., `.zip`, `.tar.gz`).  
- **Installers**: Packages for installing software (e.g., `.msi`, `.deb` files).  
- **Documentation**: Generated files providing information about the project (e.g., HTML, PDF).  
- **Configuration Files**: Files needed for application configuration (e.g., `.xml`, `.yaml`).  
- **Container Images**: Docker images that include the application and its dependencies.  
- **Test Reports**: Files detailing the results of automated tests (e.g., XML, HTML).  

Artifacts are stored in repositories or package registries, such as JFrog Artifactory, Nexus Repository, and AWS CodeArtifact.  

## 4. Maven Lifecycle Phases  
Maven uses a well-defined lifecycle consisting of phases executed in sequence:  
1. **validate**: Checks if the project structure and dependencies are correct.  
2. **compile**: Compiles the source code.  
3. **test**: Runs unit tests to verify functionality. 
      ## Why Run Tests in Build Automation?

      Automated tests ensure code quality and reliability by catching issues early and providing fast feedback. Integrating tests into the build process helps maintain confidence as software evolves.

      | Test Type      | Purpose                        | Example                | Tools           |
      |----------------|-------------------------------|------------------------|-----------------|
      | Unit           | Test functions in isolation    | `add(2,3)` → `5`       | JUnit, pytest   |
      | Integration    | Modules work together          | API stores data        | Postman, JUnit  |
      | Functional     | User features work             | Login, dashboard       | Selenium        |
      | Regression     | Old features still work        | Forgot password        | JUnit, pytest   |
      | Lint/Static    | Code quality checks            | No unused vars         | SonarQube       |

      **Benefits:**  
      - Early bug detection  
      - Consistent, repeatable checks  
      - Fast developer feedback  
      - Quality assurance  
      - Saves time

      Automated testing in build tools leads to robust, reliable software.
4. **package**: Packages the code into formats like JAR or WAR.  
5. **verify**: Ensures the package meets the required standards.  
         ### 5.1. What Happens During the `verify` Phase?

         The `verify` phase is a critical checkpoint in the Maven lifecycle. It ensures your build is ready for installation and deployment by running automated tests, code quality checks, artifact validation, and compliance checks.

         - **Automated Tests:** All unit, integration, and functional tests must pass.  
         - **Code Quality:** Static analysis tools (SonarQube, Checkstyle, PMD) check for code standards and security issues.  
         - **Artifact Validation:** Confirms the package is complete and correctly built.  
         - **Compliance:** Checks licensing, versioning, and naming conventions.

         If any step fails, the build stops before installation or deployment, preventing defective software from reaching production.

         **Example:**  
         If you run `mvn verify` and a test fails, the build halts. For a banking app, this means no deployment if security or integration tests fail.

6. **install**: Installs the package into the local Maven repository.  
7. **deploy**: Deploys the package to a remote repository for sharing.  

## 5. Maven Lifecycle Image  
![Image](https://github.com/user-attachments/assets/34f164ff-da04-4fa9-932f-30225e9df2a5)  

## 6. Automation Tools for Build Management  
Automation tools streamline the build, test, and deployment processes. Popular tools include:  
- **Jenkins**: An open-source server for continuous integration and continuous delivery (CI/CD).  
- **Gradle**: A flexible build tool supporting multi-language projects.  
- **Ant**: A Java-based build tool that automates build processes.  
- **Docker**: Automates deploying applications within containers.  

## 7. Maven Commands  
Here are some basic Maven commands:  
- `mvn validate`: Validates the project setup.  
- `mvn compile`: Compiles the source code.  
- `mvn test`: Runs unit tests.  
- `mvn package`: Packages the project into a JAR or WAR file.  
- `mvn install`: Installs the package into the local repository.  
- `mvn deploy`: Deploys the package to a remote repository.  

## 8. Maven Built-in Lifecycles  
Maven has three built-in lifecycles:  
1. **default**: Handles project deployment, including compiling, testing, and packaging.  
2. **clean**: Manages project cleaning, removing files from previous builds.  
3. **site**: Generates project site and documentation.  

## 9. Basic Usage of Maven  

### Installing Maven  
1. Download Maven from the official [Apache Maven website](https://maven.apache.org/).  
2. Extract the tar file and set up the environment path:  
    ```bash  
    wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
    tar xzvf apache-maven-3.9.9-bin.tar.gz

    export PATH=$(pwd)/apache-maven-3.9.9/bin:$PATH  
    ```  

### Adding Dependencies  
Add dependencies in the `pom.xml` file. Maven will automatically download the required dependencies. Example:  
```xml  
<dependency>  
  <groupId>org.springframework</groupId>  
  <artifactId>spring-core</artifactId>  
  <version>5.3.20</version>  
</dependency>  
```  

### Example `pom.xml` File  
Here’s a simple example of a `pom.xml` file:  
```xml  
<project xmlns="http://maven.apache.org/POM/4.0.0"  
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"  
            xsi:schemaLocation="http://maven.apache.org/POM/4.0.0  
            http://maven.apache.org/xsd/maven-4.0.0.xsd">  
  <modelVersion>4.0.0</modelVersion>  
  <groupId>com.example</groupId>  
  <artifactId>my-app</artifactId>  
  <version>1.0-SNAPSHOT</version>  
  <dependencies>  
     <dependency>  
        <groupId>junit</groupId>  
        <artifactId>junit</artifactId>  
        <version>4.13.2</version>  
        <scope>test</scope>  
     </dependency>  
  </dependencies>  
</project>  
```  