[33mcommit b8976f094d7160ffa21d0dc2bd9738cb24bd9ce8[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m)[m
Author: Fredigp <fredisongp@gmail.com>
Date:   Tue Mar 3 14:57:18 2020 -0300

    H2 database, test profile, JPA

[1mdiff --git a/.gitignore b/.gitignore[m
[1mnew file mode 100644[m
[1mindex 0000000..a2a3040[m
[1m--- /dev/null[m
[1m+++ b/.gitignore[m
[36m@@ -0,0 +1,31 @@[m
[32m+[m[32mHELP.md[m
[32m+[m[32mtarget/[m
[32m+[m[32m!.mvn/wrapper/maven-wrapper.jar[m
[32m+[m[32m!**/src/main/**[m
[32m+[m[32m!**/src/test/**[m
[32m+[m
[32m+[m[32m### STS ###[m
[32m+[m[32m.apt_generated[m
[32m+[m[32m.classpath[m
[32m+[m[32m.factorypath[m
[32m+[m[32m.project[m
[32m+[m[32m.settings[m
[32m+[m[32m.springBeans[m
[32m+[m[32m.sts4-cache[m
[32m+[m
[32m+[m[32m### IntelliJ IDEA ###[m
[32m+[m[32m.idea[m
[32m+[m[32m*.iws[m
[32m+[m[32m*.iml[m
[32m+[m[32m*.ipr[m
[32m+[m
[32m+[m[32m### NetBeans ###[m
[32m+[m[32m/nbproject/private/[m
[32m+[m[32m/nbbuild/[m
[32m+[m[32m/dist/[m
[32m+[m[32m/nbdist/[m
[32m+[m[32m/.nb-gradle/[m
[32m+[m[32mbuild/[m
[32m+[m
[32m+[m[32m### VS Code ###[m
[32m+[m[32m.vscode/[m
[1mdiff --git a/.mvn/wrapper/MavenWrapperDownloader.java b/.mvn/wrapper/MavenWrapperDownloader.java[m
[1mnew file mode 100644[m
[1mindex 0000000..e76d1f3[m
[1m--- /dev/null[m
[1m+++ b/.mvn/wrapper/MavenWrapperDownloader.java[m
[36m@@ -0,0 +1,117 @@[m
[32m+[m[32m/*[m
[32m+[m[32m * Copyright 2007-present the original author or authors.[m
[32m+[m[32m *[m
[32m+[m[32m * Licensed under the Apache License, Version 2.0 (the "License");[m
[32m+[m[32m * you may not use this file except in compliance with the License.[m
[32m+[m[32m * You may obtain a copy of the License at[m
[32m+[m[32m *[m
[32m+[m[32m *      https://www.apache.org/licenses/LICENSE-2.0[m
[32m+[m[32m *[m
[32m+[m[32m * Unless required by applicable law or agreed to in writing, software[m
[32m+[m[32m * distributed under the License is distributed on an "AS IS" BASIS,[m
[32m+[m[32m * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.[m
[32m+[m[32m * See the License for the specific language governing permissions and[m
[32m+[m[32m * limitations under the License.[m
[32m+[m[32m */[m
[32m+[m[32mimport java.net.*;[m
[32m+[m[32mimport java.io.*;[m
[32m+[m[32mimport java.nio.channels.*;[m
[32m+[m[32mimport java.util.Properties;[m
[32m+[m
[32m+[m[32mpublic class MavenWrapperDownloader {[m
[32m+[m
[32m+[m[32m    private static final String WRAPPER_VERSION = "0.5.6";[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Default URL to download the maven-wrapper.jar from, if no 'downloadUrl' is provided.[m
[32m+[m[32m     */[m
[32m+[m[32m    private static final String DEFAULT_DOWNLOAD_URL = "https://repo.maven.apache.org/maven2/io/takari/maven-wrapper/"[m
[32m+[m[32m        + WRAPPER_VERSION + "/maven-wrapper-" + WRAPPER_VERSION + ".jar";[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Path to the maven-wrapper.properties file, which might contain a downloadUrl property to[m
[32m+[m[32m     * use instead of the default one.[m
[32m+[m[32m     */[m
[32m+[m[32m    private static final String MAVEN_WRAPPER_PROPERTIES_PATH =[m
[32m+[m[32m            ".mvn/wrapper/maven-wrapper.properties";[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Path where the maven-wrapper.jar will be saved to.[m
[32m+[m[32m     */[m
[32m+[m[32m    private static final String MAVEN_WRAPPER_JAR_PATH =[m
[32m+[m[32m            ".mvn/wrapper/maven-wrapper.jar";[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Name of the property which should be used to override the default download url for the wrapper.[m
[32m+[m[32m     */[m
[32m+[m[32m    private static final String PROPERTY_NAME_WRAPPER_URL = "wrapperUrl";[m
[32m+[m
[32m+[m[32m    public static void main(String args[]) {[m
[32m+[m[32m        System.out.println("- Downloader started");[m
[32m+[m[32m        File baseDirectory = new File(args[0]);[m
[32m+[m[32m        System.out.println("- Using base directory: " + baseDirectory.getAbsolutePath());[m
[32m+[m
[32m+[m[32m        // If the maven-wrapper.properties exists, read it and check if it contains a custom[m
[32m+[m[32m        // wrapperUrl parameter.[m
[32m+[m[32m        File mavenWrapperPropertyFile = new File(baseDirectory, MAVEN_WRAPPER_PROPERTIES_PATH);[m
[32m+[m[32m        String url = DEFAULT_DOWNLOAD_URL;[m
[32m+[m[32m        if(mavenWrapperPropertyFile.exists()) {[m
[32m+[m[32m            FileInputStream mavenWrapperPropertyFileInputStream = null;[m
[32m+[m[32m            try {[m
[32m+[m[32m                mavenWrapperPropertyFileInputStream = new FileInputStream(mavenWrapperPropertyFile);[m
[32m+[m[32m                Properties mavenWrapperProperties = new Properties();[m
[32m+[m[32m                mavenWrapperProperties.load(mavenWrapperPropertyFileInputStream);[m
[32m+[m[32m                url = mavenWrapperProperties.getProperty(PROPERTY_NAME_WRAPPER_URL, url);[m
[32m+[m[32m            } catch (IOException e) {[m
[32m+[m[32m                System.out.println("- ERROR loading '" + MAVEN_WRAPPER_PROPERTIES_PATH + "'");[m
[32m+[m[32m            } finally {[m
[32m+[m[32m                try {[m
[32m+[m[32m                    if(mavenWrapperPropertyFileInputStream != null) {[m
[32m+[m[32m                        mavenWrapperPropertyFileInputStream.close();[m
[32m+[m[32m                    }[m
[32m+[m[32m                } catch (IOException e) {[m
[32m+[m[32m                    // Ignore ...[m
[32m+[m[32m                }[m
[32m+[m[32m            }[m
[32m+[m[32m        }[m
[32m+[m[32m        System.out.println("- Downloading from: " + url);[m
[32m+[m
[32m+[m[32m        File outputFile = new File(baseDirectory.getAbsolutePath(), MAVEN_WRAPPER_JAR_PATH);[m
[32m+[m[32m        if(!outputFile.getParentFile().exists()) {[m
[32m+[m[32m            if(!outputFile.getParentFile().mkdirs()) {[m
[32m+[m[32m                System.out.println([m
[32m+[m[32m                        "- ERROR creating output directory '" + outputFile.getParentFile().getAbsolutePath() + "'");[m
[32m+[m[32m            }[m
[32m+[m[32m        }[m
[32m+[m[32m        System.out.println("- Downloading to: " + outputFile.getAbsolutePath());[m
[32m+[m[32m        try {[m
[32m+[m[32m            downloadFileFromURL(url, outputFile);[m
[32m+[m[32m            System.out.println("Done");[m
[32m+[m[32m            System.exit(0);[m
[32m+[m[32m        } catch (Throwable e) {[m
[32m+[m[32m            System.out.println("- Error downloading");[m
[32m+[m[32m            e.printStackTrace();[m
[32m+[m[32m            System.exit(1);[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    private static void downloadFileFromURL(String urlString, File destination) throws Exception {[m
[32m+[m[32m        if (System.getenv("MVNW_USERNAME") != null && System.getenv("MVNW_PASSWORD") != null) {[m
[32m+[m[32m            String username = System.getenv("MVNW_USERNAME");[m
[32m+[m[32m            char[] password = System.getenv("MVNW_PASSWORD").toCharArray();[m
[32m+[m[32m            Authenticator.setDefault(new Authenticator() {[m
[32m+[m[32m                @Override[m
[32m+[m[32m                protected PasswordAuthentication getPasswordAuthentication() {[m
[32m+[m[32m                    return new PasswordAuthentication(username, password);[m
[32m+[m[32m                }[m
[32m+[m[32m            });[m
[32m+[m[32m        }[m
[32m+[m[32m        URL website = new URL(urlString);[m
[32m+[m[32m        ReadableByteChannel rbc;[m
[32m+[m[32m        rbc = Channels.newChannel(website.openStream());[m
[32m+[m[32m        FileOutputStream fos = new FileOutputStream(destination);[m
[32m+[m[32m        fos.getChannel().transferFrom(rbc, 0, Long.MAX_VALUE);[m
[32m+[m[32m        fos.close();[m
[32m+[m[32m        rbc.close();[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m}[m
[1mdiff --git a/.mvn/wrapper/maven-wrapper.jar b/.mvn/wrapper/maven-wrapper.jar[m
[1mnew file mode 100644[m
[1mindex 0000000..2cc7d4a[m
Binary files /dev/null and b/.mvn/wrapper/maven-wrapper.jar differ
[1mdiff --git a/.mvn/wrapper/maven-wrapper.properties b/.mvn/wrapper/maven-wrapper.properties[m
[1mnew file mode 100644[m
[1mindex 0000000..642d572[m
[1m--- /dev/null[m
[1m+++ b/.mvn/wrapper/maven-wrapper.properties[m
[36m@@ -0,0 +1,2 @@[m
[32m+[m[32mdistributionUrl=https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.6.3/apache-maven-3.6.3-bin.zip[m
[32m+[m[32mwrapperUrl=https://repo.maven.apache.org/maven2/io/takari/maven-wrapper/0.5.6/maven-wrapper-0.5.6.jar[m
[1mdiff --git a/mvnw b/mvnw[m
[1mnew file mode 100644[m
[1mindex 0000000..a16b543[m
[1m--- /dev/null[m
[1m+++ b/mvnw[m
[36m@@ -0,0 +1,310 @@[m
[32m+[m[32m#!/bin/sh[m
[32m+[m[32m# ----------------------------------------------------------------------------[m
[32m+[m[32m# Licensed to the Apache Software Foundation (ASF) under one[m
[32m+[m[32m# or more contributor license agreements.  See the NOTICE file[m
[32m+[m[32m# distributed with this work for additional information[m
[32m+[m[32m# regarding copyright ownership.  The ASF licenses this file[m
[32m+[m[32m# to you under the Apache License, Version 2.0 (the[m
[32m+[m[32m# "License"); you may not use this file except in compliance[m
[32m+[m[32m# with the License.  You may obtain a copy of the License at[m
[32m+[m[32m#[m
[32m+[m[32m#    https://www.apache.org/licenses/LICENSE-2.0[m
[32m+[m[32m#[m
[32m+[m[32m# Unless required by applicable law or agreed to in writing,[m
[32m+[m[32m# software distributed under the License is distributed on an[m
[32m+[m[32m# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY[m
[32m+[m[32m# KIND, either express or implied.  See the License for the[m
[32m+[m[32m# specific language governing permissions and limitations[m
[32m+[m[32m# under the License.[m
[32m+[m[32m# ----------------------------------------------------------------------------[m
[32m+[m
[32m+[m[32m# ----------------------------------------------------------------------------[m
[32m+[m[32m# Maven Start Up Batch script[m
[32m+[m[32m#[m
[32m+[m[32m# Required ENV vars:[m
[32m+[m[32m# ------------------[m
[32m+[m[32m#   JAVA_HOME - location of a JDK home dir[m
[32m+[m[32m#[m
[32m+[m[32m# Optional ENV vars[m
[32m+[m[32m# -----------------[m
[32m+[m[32m#   M2_HOME - location of maven2's installed home dir[m
[32m+[m[32m#   MAVEN_OPTS - parameters passed to the Java VM when running Maven[m
[32m+[m[32m#     e.g. to debug Maven itself, use[m
[32m+[m[32m#       set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000[m
[32m+[m[32m#   MAVEN_SKIP_RC - flag to disable loading of mavenrc files[m
[32m+[m[32m# ----------------------------------------------------------------------------[m
[32m+[m
[32m+[m[32mif [ -z "$MAVEN_SKIP_RC" ] ; then[m
[32m+[m
[32m+[m[32m  if [ -f /etc/mavenrc ] ; then[m
[32m+[m[32m    . /etc/mavenrc[m
[32m+[m[32m  fi[m
[32m+[m
[32m+[m[32m  if [ -f "$HOME/.mavenrc" ] ; then[m
[32m+[m[32m    . "$HOME/.mavenrc"[m
[32m+[m[32m  fi[m
[32m+[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32m# OS specific support.  $var _must_ be set to either true or false.[m
[32m+[m[32mcygwin=false;[m
[32m+[m[32mdarwin=false;[m
[32m+[m[32mmingw=false[m
[32m+[m[32mcase "`uname`" in[m
[32m+[m[32m  CYGWIN*) cygwin=true ;;[m
[32m+[m[32m  MINGW*) mingw=true;;[m
[32m+[m[32m  Darwin*) darwin=true[m
[32m+[m[32m    # Use /usr/libexec/java_home if available, otherwise fall back to /Library/Java/Home[m
[32m+[m[32m    # See https://developer.apple.com/library/mac/qa/qa1170/_index.html[m
[32m+[m[32m    if [ -z "$JAVA_HOME" ]; then[m
[32m+[m[32m      if [ -x "/usr/libexec/java_home" ]; then[m
[32m+[m[32m        export JAVA_HOME="`/usr/libexec/java_home`"[m
[32m+[m[32m      else[m
[32m+[m[32m        export JAVA_HOME="/Library/Java/Home"[m
[32m+[m[32m      fi[m
[32m+[m[32m    fi[m
[32m+[m[32m    ;;[m
[32m+[m[32mesac[m
[32m+[m
[32m+[m[32mif [ -z "$JAVA_HOME" ] ; then[m
[32m+[m[32m  if [ -r /etc/gentoo-release ] ; then[m
[32m+[m[32m    JAVA_HOME=`java-config --jre-home`[m
[32m+[m[32m  fi[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32mif [ -z "$M2_HOME" ] ; then[m
[32m+[m[32m  ## resolve links - $0 may be a link to maven's home[m
[32m+[m[32m  PRG="$0"[m
[32m+[m
[32m+[m[32m  # need this for relative symlinks[m
[32m+[m[32m  while [ -h "$PRG" ] ; do[m
[32m+[m[32m    ls=`ls -ld "$PRG"`[m
[32m+[m[32m    link=`expr "$ls" : '.*-> \(.*\)$'`[m
[32m+[m[32m    if expr "$link" : '/.*' > /dev/null; then[m
[32m+[m[32m      PRG="$link"[m
[32m+[m[32m    else[m
[32m+[m[32m      PRG="`dirname "$PRG"`/$link"[m
[32m+[m[32m    fi[m
[32m+[m[32m  done[m
[32m+[m
[32m+[m[32m  saveddir=`pwd`[m
[32m+[m
[32m+[m[32m  M2_HOME=`dirname "$PRG"`/..[m
[32m+[m
[32m+[m[32m  # make it fully qualified[m
[32m+[m[32m  M2_HOME=`cd "$M2_HOME" && pwd`[m
[32m+[m
[32m+[m[32m  cd "$saveddir"[m
[32m+[m[32m  # echo Using m2 at $M2_HOME[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32m# For Cygwin, ensure paths are in UNIX format before anything is touched[m
[32m+[m[32mif $cygwin ; then[m
[32m+[m[32m  [ -n "$M2_HOME" ] &&[m
[32m+[m[32m    M2_HOME=`cygpath --unix "$M2_HOME"`[m
[32m+[m[32m  [ -n "$JAVA_HOME" ] &&[m
[32m+[m[32m    JAVA_HOME=`cygpath --unix "$JAVA_HOME"`[m
[32m+[m[32m  [ -n "$CLASSPATH" ] &&[m
[32m+[m[32m    CLASSPATH=`cygpath --path --unix "$CLASSPATH"`[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32m# For Mingw, ensure paths are in UNIX format before anything is touched[m
[32m+[m[32mif $mingw ; then[m
[32m+[m[32m  [ -n "$M2_HOME" ] &&[m
[32m+[m[32m    M2_HOME="`(cd "$M2_HOME"; pwd)`"[m
[32m+[m[32m  [ -n "$JAVA_HOME" ] &&[m
[32m+[m[32m    JAVA_HOME="`(cd "$JAVA_HOME"; pwd)`"[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32mif [ -z "$JAVA_HOME" ]; then[m
[32m+[m[32m  javaExecutable="`which javac`"[m
[32m+[m[32m  if [ -n "$javaExecutable" ] && ! [ "`expr \"$javaExecutable\" : '\([^ ]*\)'`" = "no" ]; then[m
[32m+[m[32m    # readlink(1) is not available as standard on Solaris 10.[m
[32m+[m[32m    readLink=`which readlink`[m
[32m+[m[32m    if [ ! `expr "$readLink" : '\([^ ]*\)'` = "no" ]; then[m
[32m+[m[32m      if $darwin ; then[m
[32m+[m[32m        javaHome="`dirname \"$javaExecutable\"`"[m
[32m+[m[32m        javaExecutable="`cd \"$javaHome\" && pwd -P`/javac"[m
[32m+[m[32m      else[m
[32m+[m[32m        javaExecutable="`readlink -f \"$javaExecutable\"`"[m
[32m+[m[32m      fi[m
[32m+[m[32m      javaHome="`dirname \"$javaExecutable\"`"[m
[32m+[m[32m      javaHome=`expr "$javaHome" : '\(.*\)/bin'`[m
[32m+[m[32m      JAVA_HOME="$javaHome"[m
[32m+[m[32m      export JAVA_HOME[m
[32m+[m[32m    fi[m
[32m+[m[32m  fi[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32mif [ -z "$JAVACMD" ] ; then[m
[32m+[m[32m  if [ -n "$JAVA_HOME"  ] ; then[m
[32m+[m[32m    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then[m
[32m+[m[32m      # IBM's JDK on AIX uses strange locations for the executables[m
[32m+[m[32m      JAVACMD="$JAVA_HOME/jre/sh/java"[m
[32m+[m[32m    else[m
[32m+[m[32m      JAVACMD="$JAVA_HOME/bin/java"[m
[32m+[m[32m    fi[m
[32m+[m[32m  else[m
[32m+[m[32m    JAVACMD="`which java`"[m
[32m+[m[32m  fi[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32mif [ ! -x "$JAVACMD" ] ; then[m
[32m+[m[32m  echo "Error: JAVA_HOME is not defined correctly." >&2[m
[32m+[m[32m  echo "  We cannot execute $JAVACMD" >&2[m
[32m+[m[32m  exit 1[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32mif [ -z "$JAVA_HOME" ] ; then[m
[32m+[m[32m  echo "Warning: JAVA_HOME environment variable is not set."[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32mCLASSWORLDS_LAUNCHER=org.codehaus.plexus.classworlds.launcher.Launcher[m
[32m+[m
[32m+[m[32m# traverses directory structure from process work directory to filesystem root[m
[32m+[m[32m# first directory with .mvn subdirectory is considered project base directory[m
[32m+[m[32mfind_maven_basedir() {[m
[32m+[m
[32m+[m[32m  if [ -z "$1" ][m
[32m+[m[32m  then[m
[32m+[m[32m    echo "Path not specified to find_maven_basedir"[m
[32m+[m[32m    return 1[m
[32m+[m[32m  fi[m
[32m+[m
[32m+[m[32m  basedir="$1"[m
[32m+[m[32m  wdir="$1"[m
[32m+[m[32m  while [ "$wdir" != '/' ] ; do[m
[32m+[m[32m    if [ -d "$wdir"/.mvn ] ; then[m
[32m+[m[32m      basedir=$wdir[m
[32m+[m[32m      break[m
[32m+[m[32m    fi[m
[32m+[m[32m    # workaround for JBEAP-8937 (on Solaris 10/Sparc)[m
[32m+[m[32m    if [ -d "${wdir}" ]; then[m
[32m+[m[32m      wdir=`cd "$wdir/.."; pwd`[m
[32m+[m[32m    fi[m
[32m+[m[32m    # end of workaround[m
[32m+[m[32m  done[m
[32m+[m[32m  echo "${basedir}"[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m# concatenates all lines of a file[m
[32m+[m[32mconcat_lines() {[m
[32m+[m[32m  if [ -f "$1" ]; then[m
[32m+[m[32m    echo "$(tr -s '\n' ' ' < "$1")"[m
[32m+[m[32m  fi[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mBASE_DIR=`find_maven_basedir "$(pwd)"`[m
[32m+[m[32mif [ -z "$BASE_DIR" ]; then[m
[32m+[m[32m  exit 1;[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32m##########################################################################################[m
[32m+[m[32m# Extension to allow automatically downloading the maven-wrapper.jar from Maven-central[m
[32m+[m[32m# This allows using the maven wrapper in projects that prohibit checking in binary data.[m
[32m+[m[32m##########################################################################################[m
[32m+[m[32mif [ -r "$BASE_DIR/.mvn/wrapper/maven-wrapper.jar" ]; then[m
[32m+[m[32m    if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m      echo "Found .mvn/wrapper/maven-wrapper.jar"[m
[32m+[m[32m    fi[m
[32m+[m[32melse[m
[32m+[m[32m    if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m      echo "Couldn't find .mvn/wrapper/maven-wrapper.jar, downloading it ..."[m
[32m+[m[32m    fi[m
[32m+[m[32m    if [ -n "$MVNW_REPOURL" ]; then[m
[32m+[m[32m      jarUrl="$MVNW_REPOURL/io/takari/maven-wrapper/0.5.6/maven-wrapper-0.5.6.jar"[m
[32m+[m[32m    else[m
[32m+[m[32m      jarUrl="https://repo.maven.apache.org/maven2/io/takari/maven-wrapper/0.5.6/maven-wrapper-0.5.6.jar"[m
[32m+[m[32m    fi[m
[32m+[m[32m    while IFS="=" read key value; do[m
[32m+[m[32m      case "$key" in (wrapperUrl) jarUrl="$value"; break ;;[m
[32m+[m[32m      esac[m
[32m+[m[32m    done < "$BASE_DIR/.mvn/wrapper/maven-wrapper.properties"[m
[32m+[m[32m    if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m      echo "Downloading from: $jarUrl"[m
[32m+[m[32m    fi[m
[32m+[m[32m    wrapperJarPath="$BASE_DIR/.mvn/wrapper/maven-wrapper.jar"[m
[32m+[m[32m    if $cygwin; then[m
[32m+[m[32m      wrapperJarPath=`cygpath --path --windows "$wrapperJarPath"`[m
[32m+[m[32m    fi[m
[32m+[m
[32m+[m[32m    if command -v wget > /dev/null; then[m
[32m+[m[32m        if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m          echo "Found wget ... using wget"[m
[32m+[m[32m        fi[m
[32m+[m[32m        if [ -z "$MVNW_USERNAME" ] || [ -z "$MVNW_PASSWORD" ]; then[m
[32m+[m[32m            wget "$jarUrl" -O "$wrapperJarPath"[m
[32m+[m[32m        else[m
[32m+[m[32m            wget --http-user=$MVNW_USERNAME --http-password=$MVNW_PASSWORD "$jarUrl" -O "$wrapperJarPath"[m
[32m+[m[32m        fi[m
[32m+[m[32m    elif command -v curl > /dev/null; then[m
[32m+[m[32m        if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m          echo "Found curl ... using curl"[m
[32m+[m[32m        fi[m
[32m+[m[32m        if [ -z "$MVNW_USERNAME" ] || [ -z "$MVNW_PASSWORD" ]; then[m
[32m+[m[32m            curl -o "$wrapperJarPath" "$jarUrl" -f[m
[32m+[m[32m        else[m
[32m+[m[32m            curl --user $MVNW_USERNAME:$MVNW_PASSWORD -o "$wrapperJarPath" "$jarUrl" -f[m
[32m+[m[32m        fi[m
[32m+[m
[32m+[m[32m    else[m
[32m+[m[32m        if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m          echo "Falling back to using Java to download"[m
[32m+[m[32m        fi[m
[32m+[m[32m        javaClass="$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.java"[m
[32m+[m[32m        # For Cygwin, switch paths to Windows format before running javac[m
[32m+[m[32m        if $cygwin; then[m
[32m+[m[32m          javaClass=`cygpath --path --windows "$javaClass"`[m
[32m+[m[32m        fi[m
[32m+[m[32m        if [ -e "$javaClass" ]; then[m
[32m+[m[32m            if [ ! -e "$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.class" ]; then[m
[32m+[m[32m                if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m                  echo " - Compiling MavenWrapperDownloader.java ..."[m
[32m+[m[32m                fi[m
[32m+[m[32m                # Compiling the Java class[m
[32m+[m[32m                ("$JAVA_HOME/bin/javac" "$javaClass")[m
[32m+[m[32m            fi[m
[32m+[m[32m            if [ -e "$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.class" ]; then[m
[32m+[m[32m                # Running the downloader[m
[32m+[m[32m                if [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m                  echo " - Running MavenWrapperDownloader.java ..."[m
[32m+[m[32m                fi[m
[32m+[m[32m                ("$JAVA_HOME/bin/java" -cp .mvn/wrapper MavenWrapperDownloader "$MAVEN_PROJECTBASEDIR")[m
[32m+[m[32m            fi[m
[32m+[m[32m        fi[m
[32m+[m[32m    fi[m
[32m+[m[32mfi[m
[32m+[m[32m##########################################################################################[m
[32m+[m[32m# End of extension[m
[32m+[m[32m##########################################################################################[m
[32m+[m
[32m+[m[32mexport MAVEN_PROJECTBASEDIR=${MAVEN_BASEDIR:-"$BASE_DIR"}[m
[32m+[m[32mif [ "$MVNW_VERBOSE" = true ]; then[m
[32m+[m[32m  echo $MAVEN_PROJECTBASEDIR[m
[32m+[m[32mfi[m
[32m+[m[32mMAVEN_OPTS="$(concat_lines "$MAVEN_PROJECTBASEDIR/.mvn/jvm.config") $MAVEN_OPTS"[m
[32m+[m
[32m+[m[32m# For Cygwin, switch paths to Windows format before running java[m
[32m+[m[32mif $cygwin; then[m
[32m+[m[32m  [ -n "$M2_HOME" ] &&[m
[32m+[m[32m    M2_HOME=`cygpath --path --windows "$M2_HOME"`[m
[32m+[m[32m  [ -n "$JAVA_HOME" ] &&[m
[32m+[m[32m    JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`[m
[32m+[m[32m  [ -n "$CLASSPATH" ] &&[m
[32m+[m[32m    CLASSPATH=`cygpath --path --windows "$CLASSPATH"`[m
[32m+[m[32m  [ -n "$MAVEN_PROJECTBASEDIR" ] &&[m
[32m+[m[32m    MAVEN_PROJECTBASEDIR=`cygpath --path --windows "$MAVEN_PROJECTBASEDIR"`[m
[32m+[m[32mfi[m
[32m+[m
[32m+[m[32m# Provide a "standardized" way to retrieve the CLI args that will[m
[32m+[m[32m# work with both Windows and non-Windows executions.[m
[32m+[m[32mMAVEN_CMD_LINE_ARGS="$MAVEN_CONFIG $@"[m
[32m+[m[32mexport MAVEN_CMD_LINE_ARGS[m
[32m+[m
[32m+[m[32mWRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain[m
[32m+[m
[32m+[m[32mexec "$JAVACMD" \[m
[32m+[m[32m  $MAVEN_OPTS \[m
[32m+[m[32m  -classpath "$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.jar" \[m
[32m+[m[32m  "-Dmaven.home=${M2_HOME}" "-Dmaven.multiModuleProjectDirectory=${MAVEN_PROJECTBASEDIR}" \[m
[32m+[m[32m  ${WRAPPER_LAUNCHER} $MAVEN_CONFIG "$@"[m
[1mdiff --git a/mvnw.cmd b/mvnw.cmd[m
[1mnew file mode 100644[m
[1mindex 0000000..c8d4337[m
[1m--- /dev/null[m
[1m+++ b/mvnw.cmd[m
[36m@@ -0,0 +1,182 @@[m
[32m+[m[32m@REM ----------------------------------------------------------------------------[m
[32m+[m[32m@REM Licensed to the Apache Software Foundation (ASF) under one[m
[32m+[m[32m@REM or more contributor license agreements.  See the NOTICE file[m
[32m+[m[32m@REM distributed with this work for additional information[m
[32m+[m[32m@REM regarding copyright ownership.  The ASF licenses this file[m
[32m+[m[32m@REM to you under the Apache License, Version 2.0 (the[m
[32m+[m[32m@REM "License"); you may not use this file except in compliance[m
[32m+[m[32m@REM with the License.  You may obtain a copy of the License at[m
[32m+[m[32m@REM[m
[32m+[m[32m@REM    https://www.apache.org/licenses/LICENSE-2.0[m
[32m+[m[32m@REM[m
[32m+[m[32m@REM Unless required by applicable law or agreed to in writing,[m
[32m+[m[32m@REM software distributed under the License is distributed on an[m
[32m+[m[32m@REM "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY[m
[32m+[m[32m@REM KIND, either express or implied.  See the License for the[m
[32m+[m[32m@REM specific language governing permissions and limitations[m
[32m+[m[32m@REM under the License.[m
[32m+[m[32m@REM ----------------------------------------------------------------------------[m
[32m+[m
[32m+[m[32m@REM ----------------------------------------------------------------------------[m
[32m+[m[32m@REM Maven Start Up Batch script[m
[32m+[m[32m@REM[m
[32m+[m[32m@REM Required ENV vars:[m
[32m+[m[32m@REM JAVA_HOME - location of a JDK home dir[m
[32m+[m[32m@REM[m
[32m+[m[32m@REM Optional ENV vars[m
[32m+[m[32m@REM M2_HOME - location of maven2's installed home dir[m
[32m+[m[32m@REM MAVEN_BATCH_ECHO - set to 'on' to enable the echoing of the batch commands[m
[32m+[m[32m@REM MAVEN_BATCH_PAUSE - set to 'on' to wait for a keystroke before ending[m
[32m+[m[32m@REM MAVEN_OPTS - parameters passed to the Java VM when running Maven[m
[32m+[m[32m@REM     e.g. to debug Maven itself, use[m
[32m+[m[32m@REM set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000[m
[32m+[m[32m@REM MAVEN_SKIP_RC - flag to disable loading of mavenrc files[m
[32m+[m[32m@REM ----------------------------------------------------------------------------[m
[32m+[m
[32m+[m[32m@REM Begin all REM lines with '@' in case MAVEN_BATCH_ECHO is 'on'[m
[32m+[m[32m@echo off[m
[32m+[m[32m@REM set title of command window[m
[32m+[m[32mtitle %0[m
[32m+[m[32m@REM enable echoing by setting MAVEN_BATCH_ECHO to 'on'[m
[32m+[m[32m@if "%MAVEN_BATCH_ECHO%" == "on"  echo %MAVEN_BATCH_ECHO%[m
[32m+[m
[32m+[m[32m@REM set %HOME% to equivalent of $HOME[m
[32m+[m[32mif "%HOME%" == "" (set "HOME=%HOMEDRIVE%%HOMEPATH%")[m
[32m+[m
[32m+[m[32m@REM Execute a user defined script before this one[m
[32m+[m[32mif not "%MAVEN_SKIP_RC%" == "" goto skipRcPre[m
[32m+[m[32m@REM check for pre script, once with legacy .bat ending and once with .cmd ending[m
[32m+[m[32mif exist "%HOME%\mavenrc_pre.bat" call "%HOME%\mavenrc_pre.bat"[m
[32m+[m[32mif exist "%HOME%\mavenrc_pre.cmd" call "%HOME%\mavenrc_pre.cmd"[m
[32m+[m[32m:skipRcPre[m
[32m+[m
[32m+[m[32m@setlocal[m
[32m+[m
[32m+[m[32mset ERROR_CODE=0[m
[32m+[m
[32m+[m[32m@REM To isolate internal variables from possible post scripts, we use another setlocal[m
[32m+[m[32m@setlocal[m
[32m+[m
[32m+[m[32m@REM ==== START VALIDATION ====[m
[32m+[m[32mif not "%JAVA_HOME%" == "" goto OkJHome[m
[32m+[m
[32m+[m[32mecho.[m
[32m+[m[32mecho Error: JAVA_HOME not found in your environment. >&2[m
[32m+[m[32mecho Please set the JAVA_HOME variable in your environment to match the >&2[m
[32m+[m[32mecho location of your Java installation. >&2[m
[32m+[m[32mecho.[m
[32m+[m[32mgoto error[m
[32m+[m
[32m+[m[32m:OkJHome[m
[32m+[m[32mif exist "%JAVA_HOME%\bin\java.exe" goto init[m
[32m+[m
[32m+[m[32mecho.[m
[32m+[m[32mecho Error: JAVA_HOME is set to an invalid directory. >&2[m
[32m+[m[32mecho JAVA_HOME = "%JAVA_HOME%" >&2[m
[32m+[m[32mecho Please set the JAVA_HOME variable in your environment to match the >&2[m
[32m+[m[32mecho location of your Java installation. >&2[m
[32m+[m[32mecho.[m
[32m+[m[32mgoto error[m
[32m+[m
[32m+[m[32m@REM ==== END VALIDATION ====[m
[32m+[m
[32m+[m[32m:init[m
[32m+[m
[32m+[m[32m@REM Find the project base dir, i.e. the directory that contains the folder ".mvn".[m
[32m+[m[32m@REM Fallback to current working directory if not found.[m
[32m+[m
[32m+[m[32mset MAVEN_PROJECTBASEDIR=%MAVEN_BASEDIR%[m
[32m+[m[32mIF NOT "%MAVEN_PROJECTBASEDIR%"=="" goto endDetectBaseDir[m
[32m+[m
[32m+[m[32mset EXEC_DIR=%CD%[m
[32m+[m[32mset WDIR=%EXEC_DIR%[m
[32m+[m[32m:findBaseDir[m
[32m+[m[32mIF EXIST "%WDIR%"\.mvn goto baseDirFound[m
[32m+[m[32mcd ..[m
[32m+[m[32mIF "%WDIR%"=="%CD%" goto baseDirNotFound[m
[32m+[m[32mset WDIR=%CD%[m
[32m+[m[32mgoto findBaseDir[m
[32m+[m
[32m+[m[32m:baseDirFound[m
[32m+[m[32mset MAVEN_PROJECTBASEDIR=%WDIR%[m
[32m+[m[32mcd "%EXEC_DIR%"[m
[32m+[m[32mgoto endDetectBaseDir[m
[32m+[m
[32m+[m[32m:baseDirNotFound[m
[32m+[m[32mset MAVEN_PROJECTBASEDIR=%EXEC_DIR%[m
[32m+[m[32mcd "%EXEC_DIR%"[m
[32m+[m
[32m+[m[32m:endDetectBaseDir[m
[32m+[m
[32m+[m[32mIF NOT EXIST "%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config" goto endReadAdditionalConfig[m
[32m+[m
[32m+[m[32m@setlocal EnableExtensions EnableDelayedExpansion[m
[32m+[m[32mfor /F "usebackq delims=" %%a in ("%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config") do set JVM_CONFIG_MAVEN_PROPS=!JVM_CONFIG_MAVEN_PROPS! %%a[m
[32m+[m[32m@endlocal & set JVM_CONFIG_MAVEN_PROPS=%JVM_CONFIG_MAVEN_PROPS%[m
[32m+[m
[32m+[m[32m:endReadAdditionalConfig[m
[32m+[m
[32m+[m[32mSET MAVEN_JAVA_EXE="%JAVA_HOME%\bin\java.exe"[m
[32m+[m[32mset WRAPPER_JAR="%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar"[m
[32m+[m[32mset WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain[m
[32m+[m
[32m+[m[32mset DOWNLOAD_URL="https://repo.maven.apache.org/maven2/io/takari/maven-wrapper/0.5.6/maven-wrapper-0.5.6.jar"[m
[32m+[m
[32m+[m[32mFOR /F "tokens=1,2 delims==" %%A IN ("%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.properties") DO ([m
[32m+[m[32m    IF "%%A"=="wrapperUrl" SET DOWNLOAD_URL=%%B[m
[32m+[m[32m)[m
[32m+[m
[32m+[m[32m@REM Extension to allow automatically downloading the maven-wrapper.jar from Maven-central[m
[32m+[m[32m@REM This allows using the maven wrapper in projects that prohibit checking in binary data.[m
[32m+[m[32mif exist %WRAPPER_JAR% ([m
[32m+[m[32m    if "%MVNW_VERBOSE%" == "true" ([m
[32m+[m[32m        echo Found %WRAPPER_JAR%[m
[32m+[m[32m    )[m
[32m+[m[32m) else ([m
[32m+[m[32m    if not "%MVNW_REPOURL%" == "" ([m
[32m+[m[32m        SET DOWNLOAD_URL="%MVNW_REPOURL%/io/takari/maven-wrapper/0.5.6/maven-wrapper-0.5.6.jar"[m
[32m+[m[32m    )[m
[32m+[m[32m    if "%MVNW_VERBOSE%" == "true" ([m
[32m+[m[32m        echo Couldn't find %WRAPPER_JAR%, downloading it ...[m
[32m+[m[32m        echo Downloading from: %DOWNLOAD_URL%[m
[32m+[m[32m    )[m
[32m+[m
[32m+[m[32m    powershell -Command "&{"^[m
[32m+[m		[32m"$webclient = new-object System.Net.WebClient;"^[m
[32m+[m		[32m"if (-not ([string]::IsNullOrEmpty('%MVNW_USERNAME%') -and [string]::IsNullOrEmpty('%MVNW_PASSWORD%'))) {"^[m
[32m+[m		[32m"$webclient.Credentials = new-object System.Net.NetworkCredential('%MVNW_USERNAME%', '%MVNW_PASSWORD%');"^[m
[32m+[m		[32m"}"^[m
[32m+[m		[32m"[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $webclient.DownloadFile('%DOWNLOAD_URL%', '%WRAPPER_JAR%')"^[m
[32m+[m		[32m"}"[m
[32m+[m[32m    if "%MVNW_VERBOSE%" == "true" ([m
[32m+[m[32m        echo Finished downloading %WRAPPER_JAR%[m
[32m+[m[32m    )[m
[32m+[m[32m)[m
[32m+[m[32m@REM End of extension[m
[32m+[m
[32m+[m[32m@REM Provide a "standardized" way to retrieve the CLI args that will[m
[32m+[m[32m@REM work with both Windows and non-Windows executions.[m
[32m+[m[32mset MAVEN_CMD_LINE_ARGS=%*[m
[32m+[m
[32m+[m[32m%MAVEN_JAVA_EXE% %JVM_CONFIG_MAVEN_PROPS% %MAVEN_OPTS% %MAVEN_DEBUG_OPTS% -classpath %WRAPPER_JAR% "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR%" %WRAPPER_LAUNCHER% %MAVEN_CONFIG% %*[m
[32m+[m[32mif ERRORLEVEL 1 goto error[m
[32m+[m[32mgoto end[m
[32m+[m
[32m+[m[32m:error[m
[32m+[m[32mset ERROR_CODE=1[m
[32m+[m
[32m+[m[32m:end[m
[32m+[m[32m@endlocal & set ERROR_CODE=%ERROR_CODE%[m
[32m+[m
[32m+[m[32mif not "%MAVEN_SKIP_RC%" == "" goto skipRcPost[m
[32m+[m[32m@REM check for post script, once with legacy .bat ending and once with .cmd ending[m
[32m+[m[32mif exist "%HOME%\mavenrc_post.bat" call "%HOME%\mavenrc_post.bat"[m
[32m+[m[32mif exist "%HOME%\mavenrc_post.cmd" call "%HOME%\mavenrc_post.cmd"[m
[32m+[m[32m:skipRcPost[m
[32m+[m
[32m+[m[32m@REM pause the script if MAVEN_BATCH_PAUSE is set to 'on'[m
[32m+[m[32mif "%MAVEN_BATCH_PAUSE%" == "on" pause[m
[32m+[m
[32m+[m[32mif "%MAVEN_TERMINATE_CMD%" == "on" exit %ERROR_CODE%[m
[32m+[m
[32m+[m[32mexit /B %ERROR_CODE%[m
[1mdiff --git a/pom.xml b/pom.xml[m
[1mnew file mode 100644[m
[1mindex 0000000..f8af7b2[m
[1m--- /dev/null[m
[1m+++ b/pom.xml[m
[36m@@ -0,0 +1,58 @@[m
[32m+[m[32m<?xml version="1.0" encoding="UTF-8"?>[m
[32m+[m[32m<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"[m
[32m+[m	[32mxsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">[m
[32m+[m	[32m<modelVersion>4.0.0</modelVersion>[m
[32m+[m	[32m<parent>[m
[32m+[m		[32m<groupId>org.springframework.boot</groupId>[m
[32m+[m		[32m<artifactId>spring-boot-starter-parent</artifactId>[m
[32m+[m		[32m<version>2.2.4.RELEASE</version>[m
[32m+[m		[32m<relativePath/> <!-- lookup parent from repository -->[m
[32m+[m	[32m</parent>[m
[32m+[m	[32m<groupId>com.example</groupId>[m
[32m+[m	[32m<artifactId>curso</artifactId>[m
[32m+[m	[32m<version>0.0.1-SNAPSHOT</version>[m
[32m+[m	[32m<name>curso</name>[m
[32m+[m	[32m<description>Demo project for Spring Boot</description>[m
[32m+[m
[32m+[m	[32m<properties>[m
[32m+[m		[32m<java.version>1.8</java.version>[m
[32m+[m	[32m</properties>[m
[32m+[m
[32m+[m	[32m<dependencies>[m
[32m+[m		[32m<dependency>[m
[32m+[m			[32m<groupId>org.springframework.boot</groupId>[m
[32m+[m			[32m<artifactId>spring-boot-starter-web</artifactId>[m
[32m+[m		[32m</dependency>[m
[32m+[m
[32m+[m		[32m<dependency>[m
[32m+[m			[32m<groupId>org.springframework.boot</groupId>[m
[32m+[m			[32m<artifactId>spring-boot-starter-test</artifactId>[m
[32m+[m			[32m<scope>test</scope>[m
[32m+[m			[32m<exclusions>[m
[32m+[m				[32m<exclusion>[m
[32m+[m					[32m<groupId>org.junit.vintage</groupId>[m
[32m+[m					[32m<artifactId>junit-vintage-engine</artifactId>[m
[32m+[m				[32m</exclusion>[m
[32m+[m			[32m</exclusions>[m
[32m+[m		[32m</dependency>[m
[32m+[m		[32m<dependency>[m
[32m+[m			[32m<groupId>org.springframework.boot</groupId>[m
[32m+[m			[32m<artifactId>spring-boot-starter-data-jpa</artifactId>[m
[32m+[m		[32m</dependency>[m
[32m+[m		[32m<dependency>[m
[32m+[m			[32m<groupId>com.h2database</groupId>[m
[32m+[m			[32m<artifactId>h2</artifactId>[m
[32m+[m			[32m<scope>runtime</scope>[m
[32m+[m		[32m</dependency>[m
[32m+[m	[32m</dependencies>[m
[32m+[m
[32m+[m	[32m<build>[m
[32m+[m		[32m<plugins>[m
[32m+[m			[32m<plugin>[m
[32m+[m				[32m<groupId>org.springframework.boot</groupId>[m
[32m+[m				[32m<artifactId>spring-boot-maven-plugin</artifactId>[m
[32m+[m			[32m</plugin>[m
[32m+[m		[32m</plugins>[m
[32m+[m	[32m</build>[m
[32m+[m
[32m+[m[32m</project>[m
[1mdiff --git a/src/main/java/com/example/curso/CursoApplication.java b/src/main/java/com/example/curso/CursoApplication.java[m
[1mnew file mode 100644[m
[1mindex 0000000..ff74fda[m
[1m--- /dev/null[m
[1m+++ b/src/main/java/com/example/curso/CursoApplication.java[m
[36m@@ -0,0 +1,13 @@[m
[32m+[m[32mpackage com.example.curso;[m
[32m+[m
[32m+[m[32mimport org.springframework.boot.SpringApplication;[m
[32m+[m[32mimport org.springframework.boot.autoconfigure.SpringBootApplication;[m
[32m+[m
[32m+[m[32m@SpringBootApplication[m
[32m+[m[32mpublic class CursoApplication {[m
[32m+[m
[32m+[m	[32mpublic static void main(String[] args) {[m
[32m+[m		[32mSpringApplication.run(CursoApplication.class, args);[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m[32m}[m
[1mdiff --git a/src/main/java/com/example/curso/entities/User.java b/src/main/java/com/example/curso/entities/User.java[m
[1mnew file mode 100644[m
[1mindex 0000000..8bdb270[m
[1m--- /dev/null[m
[1m+++ b/src/main/java/com/example/curso/entities/User.java[m
[36m@@ -0,0 +1,104 @@[m
[32m+[m[32mpackage com.example.curso.entities;[m
[32m+[m
[32m+[m[32mimport java.io.Serializable;[m
[32m+[m
[32m+[m[32mimport javax.persistence.Entity;[m
[32m+[m[32mimport javax.persistence.GeneratedValue;[m
[32m+[m[32mimport javax.persistence.GenerationType;[m
[32m+[m[32mimport javax.persistence.Id;[m
[32m+[m
[32m+[m[32m@Entity[m
[32m+[m[32mpublic class User implements Serializable{[m
[32m+[m[41m	[m
[32m+[m	[32mprivate static final long serialVersionUID = 1L;[m
[32m+[m[41m	[m
[32m+[m	[32m@Id[m
[32m+[m	[32m@GeneratedValue(strategy = GenerationType.IDENTITY)[m
[32m+[m	[32mprivate Long id;[m
[32m+[m	[32mprivate String name;[m
[32m+[m	[32mprivate String email;[m
[32m+[m	[32mprivate String phone;[m
[32m+[m	[32mprivate String password;[m
[32m+[m[41m	[m
[32m+[m	[32mpublic User() {[m[41m		[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mpublic User(Long id, String name, String email, String phone, String password) {[m
[32m+[m		[32msuper();[m
[32m+[m		[32mthis.id = id;[m
[32m+[m		[32mthis.name = name;[m
[32m+[m		[32mthis.email = email;[m
[32m+[m		[32mthis.phone = phone;[m
[32m+[m		[32mthis.password = password;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mpublic Long getId() {[m
[32m+[m		[32mreturn id;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mpublic void setId(Long id) {[m
[32m+[m		[32mthis.id = id;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mpublic String getName() {[m
[32m+[m		[32mreturn name;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mpublic void setName(String name) {[m
[32m+[m		[32mthis.name = name;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mpublic String getEmail() {[m
[32m+[m		[32mreturn email;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mpublic void setEmail(String email) {[m
[32m+[m		[32mthis.email = email;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mpublic String getPhone() {[m
[32m+[m		[32mreturn phone;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mpublic void setPhone(String phone) {[m
[32m+[m		[32mthis.phone = phone;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mpublic String getPassword() {[m
[32m+[m		[32mreturn password;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mpublic void setPassword(String password) {[m
[32m+[m		[32mthis.password = password;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32m@Override[m
[32m+[m	[32mpublic int hashCode() {[m
[32m+[m		[32mfinal int prime = 31;[m
[32m+[m		[32mint result = 1;[m
[32m+[m		[32mresult = prime * result + ((id == null) ? 0 : id.hashCode());[m
[32m+[m		[32mreturn result;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32m@Override[m
[32m+[m	[32mpublic boolean equals(Object obj) {[m
[32m+[m		[32mif (this == obj)[m
[32m+[m			[32mreturn true;[m
[32m+[m		[32mif (obj == null)[m
[32m+[m			[32mreturn false;[m
[32m+[m		[32mif (getClass() != obj.getClass())[m
[32m+[m			[32mreturn false;[m
[32m+[m		[32mUser other = (User) obj;[m
[32m+[m		[32mif (id == null) {[m
[32m+[m			[32mif (other.id != null)[m
[32m+[m				[32mreturn false;[m
[32m+[m		[32m} else if (!id.equals(other.id))[m
[32m+[m			[32mreturn false;[m
[32m+[m		[32mreturn true;[m
[32m+[m	[32m}[m
[32m+[m[41m	[m
[32m+[m[41m	[m
[32m+[m[41m	[m
[32m+[m[41m	[m
[32m+[m[41m	[m
[32m+[m[32m}[m
[1mdiff --git a/src/main/java/com/example/curso/resources/UserResource.java b/src/main/java/com/example/curso/resources/UserResource.java[m
[1mnew file mode 100644[m
[1mindex 0000000..eceb18a[m
[1m--- /dev/null[m
[1m+++ b/src/main/java/com/example/curso/resources/UserResource.java[m
[36m@@ -0,0 +1,20 @@[m
[32m+[m[32mpackage com.example.curso.resources;[m
[32m+[m
[32m+[m[32mimport org.springframework.http.ResponseEntity;[m
[32m+[m[32mimport org.springframework.web.bind.annotation.GetMapping;[m
[32m+[m[32mimport org.springframework.web.bind.annotation.RequestMapping;[m
[32m+[m[32mimport org.springframework.web.bind.annotation.RestController;[m
[32m+[m
[32m+[m[32mimport com.example.curso.entities.User;[m
[32m+[m
[32m+[m[32m@RestController[m
[32m+[m[32m@RequestMapping(value="/users")[m
[32m+[m[32mpublic class UserResource {[m
[32m+[m[41m	[m
[32m+[m	[32m@GetMapping[m
[32m+[m	[32mpublic ResponseEntity<User> findAll(){[m
[32m+[m		[32mUser u = new User(1L, "Maria", "maria.com", "954546565", "12345");[m
[32m+[m		[32mreturn ResponseEntity.ok().body(u);[m[41m		[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m[32m}[m
[1mdiff --git a/src/main/resources/application-test.properties b/src/main/resources/application-test.properties[m
[1mnew file mode 100644[m
[1mindex 0000000..d782101[m
[1m--- /dev/null[m
[1m+++ b/src/main/resources/application-test.properties[m
[36m@@ -0,0 +1,7 @@[m
[32m+[m[32mspring.datasource.url=jdbc:h2:mem:testdb[m
[32m+[m[32mspring.datasource.username=sa[m
[32m+[m[32mspring.datasource.password=[m
[32m+[m[32mspring.h2.console.enabled=true[m
[32m+[m[32mspring.h2.console.path=/h2-console[m
[32m+[m[32mspring.jpa.show-sql=true[m
[32m+[m[32mspring.jpa.properties.hibernate.format_sql=true[m
\ No newline at end of file[m
[1mdiff --git a/src/main/resources/application.properties b/src/main/resources/application.properties[m
[1mnew file mode 100644[m
[1mindex 0000000..89147b9[m
[1m--- /dev/null[m
[1m+++ b/src/main/resources/application.properties[m
[36m@@ -0,0 +1,2 @@[m
[32m+[m[32mspring.profiles.active=test[m
[32m+[m[32mspring.jpa.open-in-view=true[m
[1mdiff --git a/src/test/java/com/example/curso/CursoApplicationTests.java b/src/test/java/com/example/curso/CursoApplicationTests.java[m
[1mnew file mode 100644[m
[1mindex 0000000..f7e3019[m
[1m--- /dev/null[m
[1m+++ b/src/test/java/com/example/curso/CursoApplicationTests.java[m
[36m@@ -0,0 +1,13 @@[m
[32m+[m[32mpackage com.example.curso;[m
[32m+[m
[32m+[m[32mimport org.junit.jupiter.api.Test;[m
[32m+[m[32mimport org.springframework.boot.test.context.SpringBootTest;[m
[32m+[m
[32m+[m[32m@SpringBootTest[m
[32m+[m[32mclass CursoApplicationTests {[m
[32m+[m
[32m+[m	[32m@Test[m
[32m+[m	[32mvoid contextLoads() {[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m[32m}[m
