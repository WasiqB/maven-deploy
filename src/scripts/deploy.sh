#
# Copyright (c) 2020 Wasiq Bhamla.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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