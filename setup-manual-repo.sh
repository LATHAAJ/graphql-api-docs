#!/bin/bash

# Manual Repository Setup Script
# This script creates the complete repository structure for manual setup

echo "🚀 Manual Documentation Repository Setup"
echo "======================================"

# Create the repository structure
echo "📁 Creating repository structure..."

# Create directories
mkdir -p graphql-api-docs/.github/workflows
mkdir -p graphql-api-docs/docs/graphql
mkdir -p graphql-api-docs/docs/versions

echo "✅ Directory structure created"

# Copy files
echo "📄 Copying files..."

# Copy README
cp docs-repo-README.md graphql-api-docs/README.md

# Copy workflow
cp docs-repo-workflow-final.yml graphql-api-docs/.github/workflows/update-docs.yml

# Copy initial documentation
cp docs-repo-initial-docs.md graphql-api-docs/docs/graphql/schema-documentation.md

# Create .gitignore
cat > graphql-api-docs/.gitignore << EOF
# Node modules
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE files
.vscode/
.idea/
*.swp
*.swo

# Logs
logs
*.log
EOF

echo "✅ Files copied successfully"

# Create setup instructions
cat > graphql-api-docs/SETUP.md << EOF
# Repository Setup Complete

This repository has been set up with the automated documentation pipeline.

## What's included:

- ✅ GitHub Actions workflow (`.github/workflows/update-docs.yml`)
- ✅ Directory structure (`docs/graphql/`, `docs/versions/`)
- ✅ Initial documentation files
- ✅ README with instructions

## Next steps:

1. **Initialize Git repository:**
   \`\`\`bash
   cd graphql-api-docs
   git init
   git add .
   git commit -m "Initial setup: Add workflow and directory structure"
   \`\`\`

2. **Add remote repository:**
   \`\`\`bash
   git remote add origin https://github.com/LATHAAJ/graphql-api-docs.git
   \`\`\`

3. **Create and push to new branch:**
   \`\`\`bash
   git checkout -b setup-automation
   git push -u origin setup-automation
   \`\`\`

4. **Configure secrets in GitHub:**
   - Go to repository settings → Secrets and variables → Actions
   - Add secret: \`MAIN_REPO_TOKEN\` with your personal access token

5. **Test the pipeline:**
   - Make a change to your GraphQL schema
   - Push the changes to trigger the documentation update

## Repository Structure:

\`\`\`
graphql-api-docs/
├── .github/
│   └── workflows/
│       └── update-docs.yml          # Receives dispatch events
├── docs/
│   ├── graphql/
│   │   └── schema-documentation.md  # Current documentation
│   └── versions/                    # Versioned documentation
├── README.md                        # Repository information
├── .gitignore                       # Git ignore rules
└── SETUP.md                         # This file
\`\`\`

## How it works:

1. When you modify the GraphQL schema in the main repository
2. The main repository workflow detects the change
3. It generates updated documentation
4. It sends a repository dispatch event to this repository
5. This repository receives the event and updates its documentation
6. Both repositories maintain a complete audit trail

## Troubleshooting:

- Check GitHub Actions logs for any errors
- Verify secrets are configured correctly
- Ensure the main repository workflow is working
- Check that the schema file path is correct
EOF

echo "✅ Setup instructions created"

echo ""
echo "🎉 Repository structure created successfully!"
echo ""
echo "📁 Location: graphql-api-docs/"
echo ""
echo "📋 Next steps:"
echo "1. cd graphql-api-docs"
echo "2. git init"
echo "3. git add ."
echo "4. git commit -m 'Initial setup'"
echo "5. git remote add origin https://github.com/LATHAAJ/graphql-api-docs.git"
echo "6. git checkout -b setup-automation"
echo "7. git push -u origin setup-automation"
echo ""
echo "📚 See SETUP.md in the repository for detailed instructions"
echo "🎯 Happy documenting! 🚀"

