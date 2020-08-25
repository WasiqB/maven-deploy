echo "gpg --passphrase \"\$GPG_PASSPHRASE\" --batch --no-tty \"\$@\"" > ./.circleci/gpg-ci
chmod 755 ./.circleci/gpg-ci