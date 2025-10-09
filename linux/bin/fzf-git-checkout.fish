
function _fco_preview
    set -l branches tags target target_ref
    
    set branches (
        git --no-pager branch --all \
            --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)\x1b[0;34;1mbranch\t\x1b[m%(refname:short)%(end)%(end)" \
        | string replace -r '^\s*$' '' # Filter out empty lines (equivalent to sed '/^$/d')
    )
    # Check if branches command failed
    if test $status -ne 0
        return
    end

    # 2. Capture tags: Pipe git tag output directly to awk for color/formatting
    set tags (
        git --no-pager tag \
        | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}'
    )
    # Check if tags command failed
    if test $status -ne 0
        return
    end

    # echo -e (string join \n $branches $tags)
    # 3. Combine branches and tags and pipe to fzf
    # Note: We use 'printf' and 'string join \n' to safely pass list content to fzf.
    set target (
        echo -e (string join \n $branches $tags) \
        | fzf --no-hscroll --no-multi -n 2 \
            --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'"
    )

    
    # Check if fzf was canceled (target will be empty)
    if test -z "$target"
        return
    end

    # 4. Extract the ref name and checkout
    # target_ref holds the second column (the branch/tag name) using awk.
    # Bash: $(awk '{print $2}' <<<"$target" )
    set target_ref (echo "$target" | awk '{print $2}')
    
    # Perform the checkout
    if test -n "$target_ref"
        git checkout "$target_ref"
    end
end
