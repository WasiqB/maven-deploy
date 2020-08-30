if [ -z "${VERSION_INCREMENT}" ] || [ "$VERSION_INCREMENT" == "skip" ]; then
  exit 0
fi
echo "Pushing new version and tag..."
rm .circleci/gpg-ci
git add pom.xml
git commit -m "Released v${MVN_VERSION} [skip ci]"
git tag -s v${MVN_VERSION} -m "Released v${MVN_VERSION}"
ssh-agent sh -c 'ssh-add ~/.ssh/id_rsa; git push $CIRCLE_REPOSITORY_URL'
ssh-agent sh -c 'ssh-add ~/.ssh/id_rsa; git push origin --tags'
echo "Successfully released ${MVN_VERSION}"