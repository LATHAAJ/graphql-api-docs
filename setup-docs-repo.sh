#!/bin/bash

# GitHub Documentation Repository Setup Script
# This script helps you create and configure the documentation repository

echo "🚀 GitHub Documentation Repository Setup"
echo "========================================"

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo "⚠️  GitHub CLI not found."
    echo "   Install it for easier setup:"
    echo "   brew install gh"
    echo "   or visit: https://cli.github.com/"
    echo ""
    echo "   You can still proceed with manual setup using the web interface."
    echo ""
    read -p "Continue with manual setup instructions? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Please install GitHub CLI or follow the manual setup guide."
        exit 1
    fi
else
    echo "✅ GitHub CLI found"
fi

echo ""
echo "📋 Setup Checklist:"
echo "1. Create Personal Access Token"
echo "2. Create Documentation Repository"
echo "3. Configure Repository Secrets"
echo "4. Test the Pipeline"
echo ""

# Get user input
read -p "Enter your GitHub username: " GITHUB_USERNAME
read -p "Enter your preferred docs repository name (default: graphql-api-docs): " DOCS_REPO_NAME
DOCS_REPO_NAME=${DOCS_REPO_NAME:-graphql-api-docs}

echo ""
echo "🔧 Configuration:"
echo "   GitHub Username: $GITHUB_USERNAME"
echo "   Docs Repository: $GITHUB_USERNAME/$DOCS_REPO_NAME"
echo ""

# Create the repository using GitHub CLI
if command -v gh &> /dev/null; then
    echo "📦 Creating documentation repository..."
    
    # Check if user is authenticated
    if ! gh auth status &> /dev/null; then
        echo "🔐 Please authenticate with GitHub CLI first:"
        echo "   gh auth login"
        exit 1
    fi
    
    # Create the repository
    gh repo create "$DOCS_REPO_NAME" \
        --public \
        --description "Automatically generated GraphQL API documentation" \
        --add-readme \
        --clone
    
    if [ $? -eq 0 ]; then
        echo "✅ Repository created successfully!"
        cd "$DOCS_REPO_NAME"
        
        # Create directory structure
        echo "📁 Creating directory structure..."
        mkdir -p .github/workflows
        mkdir -p docs/graphql
        mkdir -p docs/versions
        
        # Copy workflow file
        echo "📄 Setting up workflow..."
        cp ../docs-repo-workflow.yml .github/workflows/update-docs.yml
        
        # Copy README
        echo "📝 Setting up README..."
        cp ../docs-repo-readme.md README.md
        
        # Create initial documentation
        echo "📚 Creating initial documentation..."
        cat > docs/graphql/schema-documentation.md << EOF
# GraphQL API Documentation

This documentation will be automatically updated when the GraphQL schema changes.

## Status

🔄 **Initializing...** This documentation will be populated automatically.

## How it works

This documentation is automatically generated from the GraphQL schema in the main repository and updated whenever schema changes are detected.

EOF
        
        # Commit initial setup
        echo "💾 Committing initial setup..."
        git add .
        git commit -m "Initial setup: Add workflow and directory structure"
        git push
        
        echo ""
        echo "✅ Documentation repository setup complete!"
        echo ""
        echo "🔗 Repository URL: https://github.com/$GITHUB_USERNAME/$DOCS_REPO_NAME"
        echo ""
        echo "📋 Next steps:"
        echo "1. Create Personal Access Token (see GITHUB_SETUP_GUIDE.md)"
        echo "2. Configure secrets in both repositories"
        echo "3. Test the pipeline"
        echo ""
        echo "🔧 Secrets to configure:"
        echo "   Main repo ($GITHUB_USERNAME/GraphQl-players):"
        echo "   - DOCS_REPO_TOKEN: [Your personal access token]"
        echo "   - DOCS_REPO_NAME: $GITHUB_USERNAME/$DOCS_REPO_NAME"
        echo ""
        echo "   Docs repo ($GITHUB_USERNAME/$DOCS_REPO_NAME):"
        echo "   - MAIN_REPO_TOKEN: [Your personal access token]"
        echo ""
        
    else
        echo "❌ Failed to create repository"
        exit 1
    fi
    
else
    echo "📋 Manual Setup Instructions:"
    echo ""
    echo "1. Go to: https://github.com/new"
    echo "2. Create repository: $DOCS_REPO_NAME"
    echo "3. Add README and .gitignore"
    echo "4. Clone the repository locally"
    echo "5. Follow the setup instructions in GITHUB_SETUP_GUIDE.md"
    echo ""
    echo "🔗 Repository URL will be: https://github.com/$GITHUB_USERNAME/$DOCS_REPO_NAME"
fi

echo ""
echo "📚 For detailed instructions, see: GITHUB_SETUP_GUIDE.md"
echo "🧪 To test the setup, run: ./test-pipeline.sh"
echo ""
echo "🎯 Happy documenting! 🚀"

