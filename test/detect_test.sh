#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testDetect()
{
  touch ${BUILD_DIR}/Application.cfc

  detect

  assertAppDetected "CFML"
}

testNoDetectMissingPomFile()
{
  detect

  assertNoAppDetected
}

testNoDetectPomFileAsDir()
{
  mkdir -p ${BUILD_DIR}/Application.cfc

  detect

  assertNoAppDetected
}
