#!/bin/bash
#
# Usage: $0 JRUBY_VERSION
# Example: $0 1.7.9
#
usage() {
  echo "This script downloads a JRuby binary package and builds an RPM out of it.  You must have rpmbuild installed (yum install rpm-build)."
  echo "Usage: $0 JRUBY_VERSION"
  echo "Example: $0 1.7.9"
}

JRUBY_VERSION=$1
if [ -z "$JRUBY_VERSION" ]; then 
  usage
  exit 1
fi

srcdir=`rpm --eval '%{_sourcedir}'`
rpmdir=$(dirname $srcdir)/RPMS
file=$srcdir/jruby-bin-$JRUBY_VERSION.tar.gz

[[ ! -f $file ]] && wget "http://jruby.org.s3.amazonaws.com/downloads/$JRUBY_VERSION/jruby-bin-$JRUBY_VERSION.tar.gz" --directory-prefix=$srcdir

cp jgem  jirb  jrake  jrdoc  jri  jruby  jrubyc $srcdir

sed -i "/JRUBY_VERSION/c\$JRUBY_VERSION" jruby.spec

# build rpm
rpmbuild -bb jruby.spec

echo "Done. Now check $rpmdir for the RPM"
