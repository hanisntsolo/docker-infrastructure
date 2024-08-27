#!/bin/bash

# Save the current directory
original_dir=$(pwd)

# Iterate over each directory in the current directory
for dir in */; do
  # Check if it is a directory
  if [ -d "$dir" ]; then
    # Change to the directory
    cd "$dir" || exit

    # Check if docker-compose.yml exists in the directory
    if [ -f "docker-compose.yml" ]; then
      echo "Running docker-compose up -d in $dir"
      # Run docker-compose up -d
      docker-compose up -d
    else
      echo "No docker-compose.yml found in $dir"
    fi

    # Return to the original directory
    cd "$original_dir" || exit
  fi
done
