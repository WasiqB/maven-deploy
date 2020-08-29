case "$SEMVER_INCREMENT" in
"major")
  VERSION_COMMAND="mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.0.0 versions:commit"
  VERSION_SNAPSHOT_COMMAND="mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.nextMajorVersion}.0.0-SNAPSHOT versions:commit"
  ;;
"minor")
  VERSION_COMMAND="mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.0 versions:commit"
  VERSION_SNAPSHOT_COMMAND="mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.nextMinorVersion}.0-SNAPSHOT versions:commit"
  ;;
"patch")
  VERSION_COMMAND="mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.incrementalVersion} versions:commit"
  VERSION_SNAPSHOT_COMMAND="mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.nextIncrementalVersion}-SNAPSHOT versions:commit"
  ;;
esac

echo "Starting new Release snapshot..."
eval "$VERSION_SNAPSHOT_COMMAND"
MVN_VERSION=$(mvn -q -Dexec.executable="echo" -Dexec.args='${project.version}' --non-recursive exec:exec)
echo "Releasing Snapshot version ${MVN_VERSION}..."
eval "$DEPLOY_COMMAND"

echo "Starting new Release..."
eval "$VERSION_COMMAND"
MVN_VERSION=$(mvn -q -Dexec.executable="echo" -Dexec.args='${project.version}' --non-recursive exec:exec)
echo "Releasing version ${MVN_VERSION}..."
eval "$DEPLOY_COMMAND"
