if [ -z "${VERSION_INCREMENT}" ] || [ "$VERSION_INCREMENT" == "skip" ]; then
  exit 0
fi
echo "Pushing new version and tag..."
git add pom.xml
git commit -m "Released v${MVN_VERSION} [skip ci]"
git tag v${MVN_VERSION} -m "Released v${MVN_VERSION}"
ssh-agent sh -c 'ssh-add ~/.ssh/id_rsa; git push $CIRCLE_REPOSITORY_URL'
ssh-agent sh -c 'ssh-add ~/.ssh/id_rsa; git push origin --tags'
rm .circleci/gpg-ci
echo "Successfully released ${MVN_VERSION}"