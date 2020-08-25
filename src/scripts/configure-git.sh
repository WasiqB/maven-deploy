git config user.name $GITHUB_USER_NAME
git config user.email $GITHUB_USER_EMAIL
git config gpg.program "./.circleci/gpg-ci"
git config user.signingkey $GPG_SIGNING_KEY