#!/bin/bash

if ! [[ $@ == *"phoenix.new"* ]]; then
  if ! [[ -f "$PWD/mix.exs" ]]; then
    echo "No mix.exs found in ${PWD}. Is this an Elixir application? Aborting."
    exit 1
  fi

  grep -q phoenix "$PWD/mix.exs" > /dev/null 2>&1
  if [[ $? -ne 0 ]]; then
    echo "Could not detect a phoenix application in your mix.exs file. Aborting."
    exit 1
  fi
  
  if ! [[ -d "$PWD/.hex" ]]; then
    echo "Creating a .hex folder in your project repo to store packages."
    mkdir -p $PWD/.hex
  fi
fi

exec "$@"
