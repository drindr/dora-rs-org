#!/usr/bin/env bash

set -e

echo "Building Dora-rs documentation..."

# Create book directory if it doesn't exist
mkdir -p book

# Update discovered books in src/index.md
echo "Updating discovered books in src/index.md..."

# Remove existing auto-generated book links (between markers)
sed -i '/<!-- AUTO-GENERATED BOOKS START -->/,/<!-- AUTO-GENERATED BOOKS END -->/d' src/index.md

# Add start marker for auto-generated books
echo "<!-- AUTO-GENERATED BOOKS START -->" >> src/index.md

# Find all subdirectories that contain book.toml (excluding the root)
for dir in */; do
    # Remove trailing slash
    dir_name="${dir%/}"

    # Skip if it's not a directory or if it's the book output directory or src directory
    if [[ ! -d "$dir_name" ]] || [[ "$dir_name" == "book" ]] || [[ "$dir_name" == "src" ]]; then
        continue
    fi

    # Check if this directory contains a book.toml file
    if [[ -f "$dir_name/book.toml" ]]; then
        # Extract description from book.toml if it exists
        description=$(grep -E '^description\s*=' "$dir_name/book.toml" | sed 's/^description\s*=\s*"\(.*\)"/\1/')

        if [[ -n "$description" ]]; then
            echo "- [$dir_name](./$dir_name) - $description" >> src/index.md
        else
            echo "- [$dir_name](./$dir_name)" >> src/index.md
        fi
    fi
done

# Add end marker for auto-generated books
echo "<!-- AUTO-GENERATED BOOKS END -->" >> src/index.md

echo "Updated discovered books in src/index.md"

# Build the main index book first
echo "Building index book..."
mdbook build
echo "Index book built successfully!"

# Clean up auto-generated content from src/index.md after building
echo "Cleaning up auto-generated content from src/index.md..."
sed -i '/<!-- AUTO-GENERATED BOOKS START -->/,/<!-- AUTO-GENERATED BOOKS END -->/d' src/index.md

# Build additional books
echo "Building additional books..."
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
