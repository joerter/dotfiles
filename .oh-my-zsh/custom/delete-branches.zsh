delete-branches () {
  git branch | grep "$1" | xargs git branch -D
}
