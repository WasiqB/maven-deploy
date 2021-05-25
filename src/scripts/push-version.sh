#
# Copyright (c) 2021 Wasiq Bhamla.
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
if [ -z "${VERSION_INCREMENT}" ] || [ "$VERSION_INCREMENT" == "skip" ]; then
  exit 0
fi
echo "Pushing new version and tag..."
git add pom.xml
git commit -m "Released v${MVN_VERSION} [skip ci]"
git tag -s v${MVN_VERSION} -m "Released v${MVN_VERSION}"
ssh-agent sh -c 'ssh-add ~/.ssh/id_rsa; git push $CIRCLE_REPOSITORY_URL'
ssh-agent sh -c 'ssh-add ~/.ssh/id_rsa; git push origin --tags'
rm .circleci/gpg-ci
echo "Successfully released ${MVN_VERSION}"