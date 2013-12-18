About
=====
This little project builds an RPM suitable for installing JRuby on your RPM-compatible system. It allows you to specify the version of JRuby you want, downloads the binaries for you, and builds a `noarch` RPM package out of it.  This project assumes you are running it on a RedHat or CentOS system.

Prerequisites
=============
It might be obvious, but you need `rpm`.  Also, you will need the `rpm-build` package, which is not obvious:
    
    sudo yum install rpm-build

Building the RPM
================
    
    # download binaries and build jruby-1.7.9 RPM
    ./create_rpm.sh 1.7.9 

    # download binaries and build jruby-1.7.0 RPM
    ./create_rpm.sh 1.7.0