#!/bin/sh

GIT_COLOUR="#f14e32" 

git_colour_text() {
    text=$1
    
    gum style --foreground "$GIT_COLOUR" "$text"
}

gum style \
    --border normal \
    --margin "1" \
    --padding "1" \
    --border-foreground "$GIT_COLOUR" \
    "$(git_colour_text " Git") Branch Manager"

get_branches() {
    if [ ${1+x} ]; then
        gum choose --limit "$1" $(git branch --format="%(refname:short)")
    else
        gum choose --no-limit $(git branch --format="%(refname:short)")
    fi
}

echo "Choose $(git_colour_text "branches") to operate on:"
branches=$(get_branches)

echo ""
echo "Choose a $(git_colour_text "command"):"
command=$(gum choose rebase delete update)
echo ""

echo $branches | tr " " "\n" | while read branch
do
    case $command in

        rebase)
            base_branch=$(get_branches 1)
            git fetch origin
            git checkout "$branch"
            git rebase "origin/$base_branch"
            ;;

        delete)
            git branch -D "$branch"
            ;;

        update)
            git checkout "$branch"
            git pull --ff-only
            ;;
    esac
done
