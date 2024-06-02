function Write-BranchName () {
    try {
        $branch = git rev-parse --abbrev-ref HEAD

        if ($branch -eq "HEAD") {
            # we're probably in detached HEAD state, so print the SHA
            $branch = git rev-parse --short HEAD
            Write-Host " ($branch)" -ForegroundColor "red"
        }
        else {
            # we're on an actual branch, so print it
            Write-Host " ($branch)" -ForegroundColor "blue"
        }
    } catch {
        # we'll end up here if we're in a newly initiated git repo
        Write-Host " (no branches yet)" -ForegroundColor "yellow"
    }
}

function prompt {
    $base = "PS "
    $path = "$($executionContext.SessionState.Path.CurrentLocation)"
    $userPrompt = "$('>' * ($nestedPromptLevel + 1)) "

    Write-Host "`n$base" -NoNewline

    if (Test-Path .git) {
        Write-Host $path -NoNewline
        Write-BranchName
    }
    else {
        # we're not in a repo so don't bother displaying branch name/sha
        Write-Host $path
    }

    return $userPrompt
}

function rits($issueNr) {
    $branch = "$(git branch --show-current)"
    git log --format="%H ($branch)%n%B" --decorate=short --grep="$issueNr"
}

function Git-Status {
    git status
}

New-Alias -Name lg -Value lazygit
New-Alias -Name gst -Value Git-Status

del alias:nv -Force
New-Alias -Name nv -Value nvim

Invoke-Expression (& { (zoxide init powershell | Out-String) })
