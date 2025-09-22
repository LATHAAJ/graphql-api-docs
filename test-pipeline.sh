#!/bin/bash

# Test script for GraphQL Documentation Pipeline
# This script helps you test the automated documentation pipeline

echo "🚀 GraphQL Documentation Pipeline Test"
echo "======================================"

# Check if we're in the right directory
if [ ! -f "src/main/resources/graphql/schema.graphql" ]; then
    echo "❌ Error: Please run this script from the root of your GraphQl-players repository"
    exit 1
fi

echo "✅ Found GraphQL schema file"

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo "⚠️  GitHub CLI not found. Install it for easier testing:"
    echo "   brew install gh"
    echo "   or visit: https://cli.github.com/"
else
    echo "✅ GitHub CLI found"
fi

echo ""
echo "📋 Pre-flight Checklist:"
echo "1. ✅ Main repository workflow file exists"
echo "2. ✅ Documentation repository created"
echo "3. ✅ Personal access token created"
echo "4. ✅ Secrets configured in both repositories"
echo ""

# Check if workflow file exists
if [ -f ".github/workflows/update-docs.yml" ]; then
    echo "✅ Main repository workflow file found"
else
    echo "❌ Main repository workflow file not found"
    echo "   Please ensure .github/workflows/update-docs.yml exists"
fi

# Check if secrets are configured (this requires GitHub CLI)
if command -v gh &> /dev/null; then
    echo ""
    echo "🔍 Checking secrets configuration..."
    
    # Check if DOCS_REPO_TOKEN secret exists
    if gh secret list | grep -q "DOCS_REPO_TOKEN"; then
        echo "✅ DOCS_REPO_TOKEN secret found"
    else
        echo "❌ DOCS_REPO_TOKEN secret not found"
        echo "   Run: gh secret set DOCS_REPO_TOKEN"
    fi
    
    # Check if DOCS_REPO_NAME secret exists
    if gh secret list | grep -q "DOCS_REPO_NAME"; then
        echo "✅ DOCS_REPO_NAME secret found"
    else
        echo "❌ DOCS_REPO_NAME secret not found"
        echo "   Run: gh secret set DOCS_REPO_NAME"
    fi
fi

echo ""
echo "🧪 Testing Options:"
echo "1. Make a small change to the schema file and push"
echo "2. Manually trigger the workflow from GitHub Actions"
echo "3. Use GitHub CLI to trigger the workflow"
echo ""

# Offer to make a test change
read -p "Would you like to make a test change to the schema file? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Create a backup
    cp src/main/resources/graphql/schema.graphql src/main/resources/graphql/schema.graphql.backup
    
    # Add a test comment
    echo "" >> src/main/resources/graphql/schema.graphql
    echo "# Test comment added by automation test script" >> src/main/resources/graphql/schema.graphql
    echo "# Timestamp: $(date)" >> src/main/resources/graphql/schema.graphql
    
    echo "✅ Test comment added to schema file"
    echo ""
    echo "📝 Next steps:"
    echo "1. git add src/main/resources/graphql/schema.graphql"
    echo "2. git commit -m 'Test: Add comment to trigger documentation update'"
    echo "3. git push"
    echo "4. Check the Actions tab in both repositories"
    echo ""
    echo "🔄 To revert the test change:"
    echo "   mv src/main/resources/graphql/schema.graphql.backup src/main/resources/graphql/schema.graphql"
else
    echo "ℹ️  No test changes made. You can manually test by:"
    echo "   1. Editing src/main/resources/graphql/schema.graphql"
    echo "   2. Committing and pushing the changes"
    echo "   3. Checking the Actions tab for workflow execution"
fi

echo ""
echo "📚 For detailed setup instructions, see: SETUP_INSTRUCTIONS.md"
echo "🎯 Happy documenting! 🚀"

