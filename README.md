About
=====
This little project builds an RPM suitable for installing JRuby on your RPM-compatible system. 

Prerequisites
=============
* You will need the `rpm-build` package: 
    
    sudo yum install rpm-build

Building the RPM
================
    
    # download binaries and build jruby-1.7.9 RPM
    ./create_rpm.sh 1.7.9 

    # download binaries and build jruby-1.7.0 RPM
    ./create_rpm.sh 1.7.0