# Apache maven

## introduction

Maven is a build automation tool used primarily for Java projects. Maven can also be used to build and manage projects written in C#, Ruby, Scala, and other languages. The Maven project is hosted by The Apache Software Foundation, where it was formerly part of the Jakarta Project.

## website

[https://maven.apache.org/](https://maven.apache.org/)

## github

[https://github.com/apache/maven](https://github.com/apache/maven)

## install

### download

[https://maven.apache.org/download.cgi](https://maven.apache.org/download.cgi)

### install

```bash
tar -zxvf apache-maven-${version}-bin.tar.gz
mv apache-maven-${version} /usr/local/
export M2_HOME=/usr/local/apache-maven-${version}
export PATH=$M2_HOME/bin:$PATH
source /etc/profile
mvn -v
```

## use maven in nushell

```bash
source path/to/nu_scripts/custom-completions/mvn/mvn-completions.nu
```
