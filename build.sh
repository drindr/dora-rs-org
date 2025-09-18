#!/usr/bin/env bash

set -e

echo "Building Dora-rs documentation..."

# Create book directory if it doesn't exist
mkdir -p book

# Build the main index book first
echo "Building index book..."
mdbook build

# Find all subdirectories that contain book.toml (excluding the root)
echo "Finding additional books to build..."
for dir in */; do
    # Remove trailing slash
    dir_name="${dir%/}"

    # Skip if it's not a directory or if it's the book output directory or src directory
    if [[ ! -d "$dir_name" ]] || [[ "$dir_name" == "book" ]] || [[ "$dir_name" == "src" ]]; then
        continue
    fi

    # Check if this directory contains a book.toml file
    if [[ -f "$dir_name/book.toml" ]]; then
        echo "Building book: $dir_name"
        mdbook build "$dir_name"
        mv "$dir_name/book" "./book/$dir_name"
        echo "Book '$dir_name' built to ./book/$dir_name"
    fi
done

echo "All books built successfully!"
