#!/bin/bash

safe_remove() {
    echo "removing $1"
    rm -f "$1" || echo "Failed to remove: $1"
}

find . -type f -print0 -name "*.pdf" | xargs -0 -P 4 -n 1 bash -c '
    file="$1"
    if [[ -f "$file" && "${file,,}" == *.pdf ]]; then
        if ! pdfinfo "$file" &>/dev/null; then
            safe_remove "$file"
        fi
    fi
' -- \
echo "PDF culling completed."
