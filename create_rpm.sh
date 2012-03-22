#!/bin/bash

srcdir=`rpm --eval '%{_sourcedir}'`
rpmdir=$(dirname $srcdir)/RPMS
file=$srcdir/jruby-bin-1.6.7.tar.gz

[[ ! -f $file ]] && wget 'http://jruby.org.s3.amazonaws.com/downloads/1.6.5/jruby-bin-1.6.5.tar.gz' --directory-prefix=$srcdir

cp jgem  jirb  jrake  jrdoc  jri  jruby  jrubyc $srcdir

# build rpm
rpmbuild -bb jruby.spec

echo "Done. Now check $rpmdir for the RPM"
