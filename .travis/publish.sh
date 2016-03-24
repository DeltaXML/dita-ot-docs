#!/usr/bin/env sh

# CI publish script

export DITA_HOME=$PWD/dita-ot-$DITA_OT_VERSION
export DITA_OT_DEV=$(find $PWD -name 'dita-ot-*+*' -type d)
export SITE_DIR=$PWD/dita-ot.github.io

if [ "$TRAVIS_PULL_REQUEST" = "false" -a "$TRAVIS_BRANCH" = "develop" ]; then
  # run site generation into
  ./gradlew -b site.gradle -Ddita.home=$DITA_HOME -Doutput.dir=$SITE_DIR/dev -PditaHomeSrc=$DITA_OT_DEV --info --stacktrace --no-daemon
else
  ./gradlew -Ddita.home=$DITA_HOME -PditaHomeSrc=$DITA_OT_DEV --info --stacktrace --no-daemon
fi
