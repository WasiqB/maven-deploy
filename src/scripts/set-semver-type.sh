setup() {
  COMMIT_SUBJECT=$(git log -1 --pretty=%s.)
}
getIncrement() {
  VERSION_INCREMENT=$(echo "${COMMIT_SUBJECT}" | sed -En 's/.*\[release:(major|minor|patch|skip)\].*/\1/p')
  echo "export VERSION_INCREMENT=\"$VERSION_INCREMENT\"" >>"$BASH_ENV"
}
checkIncrement() {
  if [ -z "${VERSION_INCREMENT}" ]; then
    echo "Commit subject did not indicate which version deployment to make."
    echo "To deploy a version, you can push another commit with [release:FOO] in the subject where FOO is major, minor, patch."
    echo "Note: To indicate intention to skip deployment, include [release:skip] in the commit subject instead."
    echo "Deployment is skipped."
    exit 0
  elif [ "$VERSION_INCREMENT" == "skip" ]; then
    echo "Trigger text is skip in commit indicated to skip version release."
    exit 0
  else
    echo "$VERSION_INCREMENT release will be deployed to Maven Central."
  fi
}
main() {
  setup
  getIncrement
  checkIncrement
}
main
