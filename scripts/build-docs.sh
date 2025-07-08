#!/bin/bash

set -e

# Ensure mkdocs and required plugins are installed
pip install mkdocs mkdocs-material mkdocs-pdf-export-plugin

echo "🔧 Building documentation structure..."

sleep 3

# Clean or create docs folder
rm -rf docs/
mkdir -p docs/lessons docs/exercises docs/quizzes docs/assets

# Copy root files
cp README.md docs/index.md
cp syllabus.md docs/
cp setup.md docs/
cp resources.md docs/
cp CONTRIBUTING.md docs/
cp CODE_OF_CONDUCT.md docs/

# Copy folders
cp -r lessons/* docs/lessons/
cp -r exercises/* docs/exercises/
cp -r quizzes/* docs/quizzes/
cp -r assets/* docs/assets

echo "✅ Docs ready in /docs. You can now run 'mkdocs serve' or 'mkdocs gh-deploy'."

# Build site with PDF generation enabled
echo "Building documentation with PDF export enabled..."

ENABLE_PDF=1 mkdocs build
