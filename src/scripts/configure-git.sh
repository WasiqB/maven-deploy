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
git config user.name $GITHUB_USER_NAME
git config user.email $GITHUB_USER_EMAIL
git config gpg.program "./.circleci/gpg-ci"
git config commit.gpgsign true
git config user.signingkey $GPG_SIGNING_KEY