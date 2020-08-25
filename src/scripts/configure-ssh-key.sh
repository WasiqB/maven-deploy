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

mkdir -p ~/.ssh
echo "Adding github.com as known host..."
echo $GITHUB_FINGERPRINT >> ~/.ssh/known_hosts
echo "Setting private SSH key for pushing new version to repo..."
echo $GITHUB_COMMIT_KEY | base64 --decode >> ~/.ssh/id_rsa
echo "Setting permissions to avoid errors."
chmod 400 ~/.ssh/id_rsa