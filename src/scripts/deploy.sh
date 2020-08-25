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

echo "Pushing new version and tag..."
rm .circleci/gpg-ci
git add pom.xml
git commit -m "Released v${MVN_VERSION} [skip ci]"
git tag -s v${MVN_VERSION} -m "Released v${MVN_VERSION}"
ssh-agent sh -c 'ssh-add ~/.ssh/id_rsa; git push $CIRCLE_REPOSITORY_URL'
ssh-agent sh -c 'ssh-add ~/.ssh/id_rsa; git push origin --tags'
echo "Successfully released ${MVN_VERSION}"