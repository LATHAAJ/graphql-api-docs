#!/bin/bash

# Cleanup script for graphql-api-docs repository
echo "🧹 Cleaning up graphql-api-docs repository..."

# Remove duplicate schema documentation files (keep only docs/ directory versions)
echo "Removing duplicate schema documentation files..."
rm -f schema-documentation-with-descriptions.md
rm -f schema-documentation-preview.md  
rm -f schema-documentation.md
rm -f graphql/schema-documentation.md

# Remove setup and test scripts (these are temporary)
echo "Removing setup and test scripts..."
rm -f setup-docs-repo.sh
rm -f setup-manual-repo.sh
rm -f test-pipeline.sh

# Remove redundant documentation files
echo "Removing redundant documentation files..."
rm -f docs-repo-readme.md
rm -f docs-repo-initial-docs.md
rm -f docs-repo-workflow.yml
rm -f docs-repo-workflow-final.yml

# Remove duplicate documentation files
echo "Removing duplicate documentation files..."
rm -f QUICK_SETUP.md
rm -f SETUP_INSTRUCTIONS.md
rm -f GITHUB_SETUP_GUIDE.md
rm -f PIPELINE_ARCHITECTURE.md

# Remove gh-pages directory (this should be handled by GitHub Pages automatically)
echo "Removing gh-pages directory..."
rm -rf gh-pages/

# Remove the cleanup script itself after execution
echo "Removing cleanup script..."
rm -f cleanup.sh

echo "✅ Cleanup completed!"
echo ""
echo "Remaining files:"
ls -la
