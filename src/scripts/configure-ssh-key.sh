mkdir -p ~/.ssh
echo "Adding github.com as known host..."
echo $GITHUB_FINGERPRINT >> ~/.ssh/known_hosts
echo "Setting private SSH key for pushing new version to repo..."
echo $GITHUB_COMMIT_KEY | base64 --decode >> ~/.ssh/id_rsa
echo "Setting permissions to avoid errors."
chmod 400 ~/.ssh/id_rsa