# shellcheck shell=bash

NORMAL_MODE_TEXT_DEFAULT="Tmux"
# NORMAL_MODE_TEXT_COLOR_DEFAULT="$TMUX_POWERLINE_CUR_SEGMENT_FG"
NORMAL_MODE_TEXT_COLOR_DEFAULT="black bold"

PREFIX_MODE_TEXT_DEFAULT="Wait"
# PREFIX_MODE_TEXT_COLOR_DEFAULT="$TMUX_POWERLINE_CUR_SEGMENT_FG"
PREFIX_MODE_TEXT_COLOR_DEFAULT="colour231 bold"

COPY_MODE_TEXT_DEFAULT="Copy"
# COPY_MODE_TEXT_COLOR_DEFAULT="$TMUX_POWERLINE_CUR_SEGMENT_FG"
COPY_MODE_TEXT_COLOR_DEFAULT="colour128 bold"

SYNC_MODE_TEXT_DEFAULT="Sync"
# SYNC_MODE_TEXT_COLOR_DEFAULT="$TMUX_POWERLINE_CUR_SEGMENT_FG"
SYNC_MODE_TEXT_COLOR_DEFAULT="colour196 bold"

generate_segmentrc() {
    read -r -d '' rccontents <<EORC
# Normal mode text & color overrides. Defaults to "Tmux" & the segment foreground color set in the theme used.
export TMUX_POWERLINE_SEG_MY_INDICATOR_NORMAL_MODE_TEXT="${NORMAL_MODE_TEXT_DEFAULT}"
export TMUX_POWERLINE_SEG_MY_INDICATOR_NORMAL_MODE_TEXT_COLOR=""

# Prefix mode text & color overrides. Defaults to "Wait" & the segment foreground color set in the theme used.
export TMUX_POWERLINE_SEG_MY_INDICATOR_PREFIX_MODE_TEXT="${PREFIX_MODE_TEXT_DEFAULT}"
export TMUX_POWERLINE_SEG_MY_INDICATOR_PREFIX_MODE_TEXT_COLOR=""

# Copy mode text & color overrides. Defaults to "Copy" & the segment foreground color set in the theme used.
export TMUX_POWERLINE_SEG_MY_INDICATOR_COPY_MODE_TEXT="${COPY_MODE_TEXT_DEFAULT}"
export TMUX_POWERLINE_SEG_MY_INDICATOR_COPY_MODE_TEXT_COLOR=""

# Sync mode text & color overrides. Defaults to "Sync" & the segment foreground color set in the theme used.
export TMUX_POWERLINE_SEG_MY_INDICATOR_SYNC_MODE_TEXT="${SYNC_MODE_TEXT_DEFAULT}"
export TMUX_POWERLINE_SEG_MY_INDICATOR_SYNC_MODE_TEXT_COLOR=""
EORC
    echo "$rccontents"
}

run_segment() {
    __process_settings

    # Colors.
    normal_text_color="#[fg=$TMUX_POWERLINE_SEG_MY_INDICATOR_NORMAL_MODE_TEXT_COLOR]"
    prefix_text_color="#[fg=$TMUX_POWERLINE_SEG_MY_INDICATOR_PREFIX_MODE_TEXT_COLOR]"
    copy_text_color="#[fg=$TMUX_POWERLINE_SEG_MY_INDICATOR_COPY_MODE_TEXT_COLOR]"
    sync_text_color="#[fg=$TMUX_POWERLINE_SEG_MY_INDICATOR_SYNC_MODE_TEXT_COLOR]"

    # Populate segment.
    normal_mode="$normal_text_color$TMUX_POWERLINE_SEG_MY_INDICATOR_NORMAL_MODE_TEXT"
    prefix_mode="$prefix_text_color$TMUX_POWERLINE_SEG_MY_INDICATOR_PREFIX_MODE_TEXT"
    copy_mode="$copy_text_color$TMUX_POWERLINE_SEG_MY_INDICATOR_COPY_MODE_TEXT"
    sync_mode="$sync_text_color$TMUX_POWERLINE_SEG_MY_INDICATOR_SYNC_MODE_TEXT"

    fallback="#{?pane_in_mode,$copy_mode,#{?synchronize-panes,$sync_mode,$normal_mode}}"
    highlight="#{?client_prefix,$prefix_mode,$fallback}"

    segment="$highlight"

    echo "$segment"
    return 0
}

__process_settings() {
    if [ -z "$TMUX_POWERLINE_SEG_MY_INDICATOR_NORMAL_MODE_TEXT" ]; then
        export TMUX_POWERLINE_SEG_MY_INDICATOR_NORMAL_MODE_TEXT="${NORMAL_MODE_TEXT_DEFAULT}"
    fi
    if [ -z "$TMUX_POWERLINE_SEG_MY_INDICATOR_NORMAL_MODE_TEXT_COLOR" ]; then
        export TMUX_POWERLINE_SEG_MY_INDICATOR_NORMAL_MODE_TEXT_COLOR="${NORMAL_MODE_TEXT_COLOR_DEFAULT}"
    fi

    if [ -z "$TMUX_POWERLINE_SEG_MY_INDICATOR_PREFIX_MODE_TEXT" ]; then
        export TMUX_POWERLINE_SEG_MY_INDICATOR_PREFIX_MODE_TEXT="${PREFIX_MODE_TEXT_DEFAULT}"
    fi
    if [ -z "$TMUX_POWERLINE_SEG_MY_INDICATOR_PREFIX_MODE_TEXT_COLOR" ]; then
        export TMUX_POWERLINE_SEG_MY_INDICATOR_PREFIX_MODE_TEXT_COLOR="${PREFIX_MODE_TEXT_COLOR_DEFAULT}"
    fi

    if [ -z "$TMUX_POWERLINE_SEG_MY_INDICATOR_COPY_MODE_TEXT" ]; then
        export TMUX_POWERLINE_SEG_MY_INDICATOR_COPY_MODE_TEXT="${COPY_MODE_TEXT_DEFAULT}"
    fi
    if [ -z "$TMUX_POWERLINE_SEG_MY_INDICATOR_COPY_MODE_TEXT_COLOR" ]; then
        export TMUX_POWERLINE_SEG_MY_INDICATOR_COPY_MODE_TEXT_COLOR="${COPY_MODE_TEXT_COLOR_DEFAULT}"
    fi

    if [ -z "$TMUX_POWERLINE_SEG_MY_INDICATOR_SYNC_MODE_TEXT" ]; then
        export TMUX_POWERLINE_SEG_MY_INDICATOR_SYNC_MODE_TEXT="${SYNC_MODE_TEXT_DEFAULT}"
    fi
    if [ -z "$TMUX_POWERLINE_SEG_MY_INDICATOR_SYNC_MODE_TEXT_COLOR" ]; then
        export TMUX_POWERLINE_SEG_MY_INDICATOR_SYNC_MODE_TEXT_COLOR="${SYNC_MODE_TEXT_COLOR_DEFAULT}"
    fi
}
