## Sonar
#### Скриншоты


![0](https://github.com/skYth1an/Ansible_1lesson/blob/352a7309060d83071983ed42ae94a4740e872bc0/images/0.JPG "0")
![1](https://github.com/skYth1an/Ansible_1lesson/blob/352a7309060d83071983ed42ae94a4740e872bc0/images/1.jpeg.PNG "1")
![2](https://github.com/skYth1an/Ansible_1lesson/blob/352a7309060d83071983ed42ae94a4740e872bc0/images/2.jpeg.PNG "2")

## Nexus

```xml
<metadata modelVersion="1.1.0">
<groupId>netology</groupId>
<artifactId>java</artifactId>
<versioning>
<latest>8_282</latest>
<release>8_282</release>
<versions>
<version>8_102</version>
<version>8_282</version>
</versions>
<lastUpdated>20220621183153</lastUpdated>
</versioning>
</metadata>
```
![4](https://github.com/skYth1an/Ansible_1lesson/blob/352a7309060d83071983ed42ae94a4740e872bc0/images/4.jpeg.PNG "1")


### Maven

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>com.netology.app</groupId>
  <artifactId>simple-app</artifactId>
  <version>1.0-SNAPSHOT</version>
   <repositories>
    <repository>
      <id>my-repo</id>
      <name>maven-public</name>
      <url>http://51.250.65.156:8081/repository/maven-public/</url>
    </repository>
  </repositories>
  <dependencies>
     <dependency>
      <groupId>netology</groupId>
      <artifactId>java</artifactId>
      <version>8_282</version>
      <classifier>distrib</classifier>
      <type>tar.gz</type>
    </dependency>
  </dependencies>
</project>

```  

![5](https://github.com/skYth1an/Ansible_1lesson/blob/352a7309060d83071983ed42ae94a4740e872bc0/images/5.jpeg.PNG "1")

