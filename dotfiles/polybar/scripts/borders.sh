#!/bin/bash

left() {
    echo -e "\U0001FB4B"
}

right() {
    echo -e "\U0001FB5B"
}

if [[ "$1" == "--left" ]]; then
    left
    exit 0
fi

if [[ "$1" == "--right" ]]; then
    right
    exit 0
fi

