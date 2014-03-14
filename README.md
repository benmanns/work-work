# Work Work

This script generates commits that will display a message to viewers of your GitHub profile on your activity graph. It works best when you don't have any commits already.

See [a demo on @benmannstest](https://github.com/benmannstest).

To customize the message, edit `message` in work_work.rb. Make sure that each line is the same length (add spaces for padding at the end). Otherwise `Array#transpose` complains.

# Running the script.

```sh
# Clone the script
git clone https://github.com/benmanns/work-work.git

# Set up the repository for all the generated commits.
mkdir work-work-push
cd work-work-push
git init

# To keep from polluting your actual GitHub profile, use a new account. Optional.
git config user.email "your-test-account@example.com"

# Make a base commit that's easy to revert to and doesn't show up in the graph.
GIT_COMMITTER_DATE="2000-01-01 00:00:00 -0000" GIT_AUTHOR_DATE="2000-01-01 00:00:00 -0000" git commit -m "root commit" --allow-empty  

ruby ../work-work/work_work.rb

# Create a GitHub repository on your (new) account.
git remote add origin git@github.com:you/work-work-push.git
git push origin master

# Enjoy!
```

# Notes

GitHub will clear your activity graph if you delete the repository. When testing, I would delete the repository, create a new one, and push to it to reset the graph. Force pushing doesn't seem to clear the activity graph.
