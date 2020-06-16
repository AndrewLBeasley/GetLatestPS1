cd C:\code\BUXTON_ANALYTICS_PLATFORM

$currentBranch = git branch --show-current
$currentChanges = (git status -s |select-string -Pattern "^\s*[A|\?|D|M]" -AllMatches).Matches.Count

$shouldUserCommit = Read-Host "This branch has unstaged changes. Would you like to stage and commit? [Y/N] "

if($currentChanges > 0) {
    $shouldUserCommit = Read-Host "This branch has unstaged changes. Would you like to stage and commit? [Y/N] "
        
    if($shouldUserCommit -eq "Y") {        
        git add . 
        Read-Host Write-Verbose("Committing changes from {0}" -f $currentBranch)
        git commit -m "comitting latest"
    }        
}


if($currentBranch -ne "master") {    
    git checkout master
    $currentBranch = git branch --show-current
}
