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
