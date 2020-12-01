function fish_prompt
    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_color_branch magenta --bold

    set -g __fish_git_prompt_char_untrackedfiles "…"
    set -g __fish_git_prompt_color_untrackedfiles red

    set -g __fish_git_prompt_char_stagedstate "●"
    set -g __fish_git_prompt_color_stagedstate green

    set -g __fish_git_prompt_char_dirtystate "+"
    set -g __fish_git_prompt_color_dirtystate blue

    # Set this to a checkmark outside of wsl (ctrl+k+O+K)
    set -g __fish_git_prompt_char_cleanstate ""
    set -g __fish_git_prompt_color_cleanstate yellow

    set -g __fish_git_prompt_char_upstream_ahead "↑"
    set -g __fish_git_prompt_char_upstream_behind "↓"
    set -g __fish_git_prompt_char_upstream_equal "="

    if test -n "$SSH_TTY"
        echo -n (set_color yellow)(prompt_hostname)' '
    end

    echo -n (set_color 3a3a3a)(prompt_pwd)

    set_color -o
    if test "$USER" = 'root'
        printf '%s' (set_color ffffff)('__fish_git_prompt')
        echo -n (set_color 00ff00)' # '
    else
        printf '%s' (set_color ffffff)('__fish_git_prompt')
        echo -n (set_color ff005f)' $ '
    end
    set_color normal
end
