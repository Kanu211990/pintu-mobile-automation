# An Android App Automation Testing Framework

### Requirement
[Ruby](https://www.ruby-lang.org/en/) with version 2.3.0 or above. We recommend to use ruby version manager like [rvm](https://rvm.io/) to install the ruby.

### Setup
Clone the repository and install all gems depedency:
```shell
$ git clone https://gitlab.tanihub.com/tanigroup/android-automation.git
$ cd android-automation
$ bundle install
$ cp .env.example .env
```

Installation preparation : 
1. Install appium Lib and cucumber 
2. Install Appium desktop
3. For Android Automation:  - Install JDK - Install Android SDK - Setup Android simulator (AVD)
4. Download repo
How to install Appium Lib and cucumber : 1. Using terminal : $ sudo gem install cucumber $ sudo gem install appium_lib

How to install Appium :
1. Go to http://appium.io/
2. Click Download Appium 
3. Download appium-desktop .dmg

How to install java JDK :
1. Go to https://www.oracle.com/technetwork/java/javase/downloads/index.html
2. Download jdk for your OS
3. Install JDK
4. Using terminal : $ touch .bash_profile $ open .bash_profile
5. On .bash_profile type : export JAVA_HOME=$(/usr/libexec/java_home)
6. Click File 
7. Click Save
8. To check ANDROID_HOME that is set or not, using terminal : $ echo $JAVA_HOME

How to install android SDK :
1. Go to https://developer.android.com/studio/index.html
2. Download android studio
3. Install android studio
4. Using terminal : $ touch .bash_profile $ open .bash_profile
5. On .bash_profile type : export ANDROID_HOME= {path your sdk. ex: “Users/Library/Android/sdk”} export PATH=“${PATH}:/$ANDROID_HOME/platform-tools:/$ANDROID_HOME/tools/bin”
6. Click File 
7. Click Save
8. To check ANDROID_HOME that is set or not, using terminal : $ adb

How to setup Android simulator :
1. Open Android studio
2. Click Start a new Android Studio Project
3. Follow step on this video : https://www.youtube.com/watch?v=h3Q_5AOlyvA

Run Android Automation : 
1. Run android simulator
2. Open appium desktop and Start Server
3. Setup capabilities on the project : - Open project - Open .env file - Edit those value based on simulator that you used (Don’t change other value): DEVICE_NAME_ANDROID="emulator-5554" PLATFORM_VERSION_ANDROID=“9”
4. If we want to run android automation, platform value on .env should be : platform=“android”
5. Open env.rb, make sure caps: caps_android
6. Open terminal that roots to the project : $ cucumber -t@login

Notes : you can get device name from terminal : $ adb devices

### Running Features Test
Run all features: `$ cucumber`

Run spesific test only: `$ cucumber features/user/login.feature`

Run by tags:  `$ cucumber -t@login`

This framework contains spesific directory functions:
```
- root directory    => contains configuration files
- features          => main directory, all test will inside this
- config            => store data in yml file that will be using in testing
- lib               => ruby helper files located
- screen            => screen class, contains locator strategies for several screen
- scenarios         => cucumber features files
- step_definitions  => code implementation of cucumber feature files
- support           => setup of test framework
```