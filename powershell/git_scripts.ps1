function git-prune-branches() {
    git branch -vv | Select-String -Pattern ': gone]' | ForEach-Object{($_ -split "\s+")[1]} | %{ git branch -D $_ }
}

function git-push-commit($commit) {
    $symbolicref = git symbolic-ref HEAD
    $branch = $symbolicref.substring($symbolicref.LastIndexOf("/") + 1)

    git push -f origin $commit`:$branch
}

function git-reset-remote() {
    git ro
}
