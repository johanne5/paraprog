#!/bin/sh
#-*-sh-*-

#
# Copyright © 2009 CNRS
# Copyright © 2009-2010 inria.  All rights reserved.
# Copyright © 2009 Université Bordeaux 1
# See COPYING in top-level directory.
#

abs_top_builddir="/local/MSP/hwloc-1.5"
distrib="$abs_top_builddir/utils/hwloc-distrib"
abs_top_srcdir="/local/MSP/hwloc-1.5"

: ${TMPDIR=/tmp}
{
  tmp=`
    (umask 077 && mktemp -d "$TMPDIR/fooXXXXXX") 2>/dev/null
  ` &&
  test -n "$tmp" && test -d "$tmp"
} || {
  tmp=$TMPDIR/foo$$-$RANDOM
  (umask 077 && mkdir "$tmp")
} || exit $?
file="$tmp/test-hwloc-distrib.output"

set -e
(
  $distrib --if synthetic --input "2 2 2" 2
  echo
  $distrib --if synthetic --input "2 2 2" 4
  echo
  $distrib --if synthetic --input "2 2 2" 8
  echo
  $distrib --if synthetic --input "2 2 2" 13
  echo
  $distrib --if synthetic --input "2 2 2" 16
  echo
  $distrib --if synthetic --input "3 3 3" 4
) > "$file"
diff -u $abs_top_srcdir/utils/test-hwloc-distrib.output "$file"
rm -rf "$tmp"
