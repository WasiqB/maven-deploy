setup() {
  COMMIT_SUBJECTT=$(git log -1 --pretty=%s.)
}
getIncrement() {
  SEMVER_INCREMENT=$(echo "${COMMIT_SUBJECT}" | sed -En 's/.*\[release:(major|minor|patch|skip)\].*/\1/p')
  echo "export SEMVER_INCREMENT=\"$SEMVER_INCREMENT\"" >>"$BASH_ENV"
}
checkIncrement() {
  if [ -z "${SEMVER_INCREMENT}" ]; then
    echo "Commit subject did not indicate which version deployment to make."
    echo "To deploy a version, you can push another commit with [release:FOO] in the subject where FOO is major, minor, patch."
    echo "Note: To indicate intention to skip deployment, include [release:skip] in the commit subject instead."
    echo "Deployment is skipped."
  elif [ "$SEMVER_INCREMENT" == "skip" ]; then
    echo "SEMVER in commit indicated to skip version release."
  else
    echo "$SEMVER_INCREMENT release will be deployed to Maven Central."
  fi
}
main() {
  setup
  getIncrement
  checkIncrement
}
main
