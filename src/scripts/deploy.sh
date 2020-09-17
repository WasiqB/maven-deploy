setMavenVersion() {
  MVN_VERSION=$(mvn -q -Dexec.executable="echo" -Dexec.args='${project.version}' --non-recursive exec:exec)
  echo "export MVN_VERSION=\"$MVN_VERSION\"" >>"$BASH_ENV"
}
setVersionCommand() {
  case "$VERSION_INCREMENT" in
  "major")
    mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.0.0 versions:commit
    ;;
  "minor")
    mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.0 versions:commit
    ;;
  "patch")
    mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.incrementalVersion} versions:commit
    ;;
  *)
    exit 0
    ;;
  esac
  setMavenVersion
}
setVersionCommandSnapshot() {
  case "$VERSION_INCREMENT" in
  "major")
    mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.nextMajorVersion}.0.0-SNAPSHOT versions:commit
    ;;
  "minor")
    mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.nextMinorVersion}.0-SNAPSHOT versions:commit
    ;;
  "patch")
    mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.nextIncrementalVersion}-SNAPSHOT versions:commit
    ;;
  *)
    exit 0
    ;;
  esac
  setMavenVersion
}
deploySnapshot() {
  echo "Starting new Release snapshot..."
  setVersionCommandSnapshot
  echo "Releasing Snapshot version ${MVN_VERSION}..."
  eval "${DEPLOY_COMMAND}"
}
deploy() {
  echo "Starting new Release..."
  setVersionCommand
  echo "Releasing version ${MVN_VERSION}..."
  eval "${DEPLOY_COMMAND}"
}
main() {
  deploySnapshot
  deploy
}
main
