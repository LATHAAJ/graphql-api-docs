# Quick GitHub Documentation Setup Guide

## 🚀 Quick Start (5 minutes)

### Step 1: Create Personal Access Token
1. Go to: https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Name: `GraphQL Docs Automation`
4. Scopes: ✅ `repo`, ✅ `workflow`
5. Click "Generate token" and **copy it immediately**

### Step 2: Create Documentation Repository
1. Go to: https://github.com/new
2. Repository name: `graphql-api-docs`
3. Description: `Automatically generated GraphQL API documentation`
4. ✅ Public, ✅ Add README
5. Click "Create repository"

### Step 3: Set Up Repository Structure
```bash
# Clone your new repository
git clone https://github.com/YOUR_USERNAME/graphql-api-docs.git
cd graphql-api-docs

# Create directories
mkdir -p .github/workflows docs/graphql docs/versions

# Copy workflow file (from your main repo)
cp ../GraphQl-players/docs-repo-workflow.yml .github/workflows/update-docs.yml

# Copy README template
cp ../GraphQl-players/docs-repo-readme.md README.md

# Commit and push
git add .
git commit -m "Initial setup: Add workflow and structure"
git push
```

### Step 4: Configure Secrets

#### In Main Repository (GraphQl-players):
1. Go to: https://github.com/YOUR_USERNAME/GraphQl-players/settings/secrets/actions
2. Add secrets:
   - **DOCS_REPO_TOKEN**: [Your personal access token]
   - **DOCS_REPO_NAME**: `YOUR_USERNAME/graphql-api-docs`

#### In Documentation Repository:
1. Go to: https://github.com/YOUR_USERNAME/graphql-api-docs/settings/secrets/actions
2. Add secret:
   - **MAIN_REPO_TOKEN**: [Your personal access token]

### Step 5: Test the Pipeline
1. Make a small change to `src/main/resources/graphql/schema.graphql`
2. Commit and push the changes
3. Check the Actions tab in both repositories
4. Verify documentation is updated

## 🔧 Automated Setup (if you have GitHub CLI)

```bash
# Run the setup script
./setup-docs-repo.sh
```

## 📋 What Gets Created

### Documentation Repository Structure:
```
graphql-api-docs/
├── .github/
│   └── workflows/
│       └── update-docs.yml          # Receives dispatch events
├── docs/
│   ├── graphql/
│   │   └── schema-documentation.md # Current documentation
│   └── versions/
│       └── schema-v*.md            # Versioned documentation
└── README.md                       # Auto-generated README
```

### Main Repository Updates:
- `.github/workflows/update-docs.yml` - Triggers documentation updates
- Secrets configured for cross-repository communication

## 🎯 Expected Behavior

1. **When you modify the schema file:**
   - Main repository workflow runs
   - Generates updated documentation
   - Sends dispatch event to docs repository
   - Docs repository updates its documentation
   - Both repositories maintain audit trail

2. **Documentation includes:**
   - Complete GraphQL schema documentation
   - Version information
   - Timestamp and commit details
   - Clickable links between types

## 🚨 Troubleshooting

### Workflow not triggering:
- Check file path: `src/main/resources/graphql/schema.graphql`
- Verify workflow file is in `.github/workflows/`
- Ensure file extension is `.yml`

### Permission errors:
- Verify personal access token has `repo` and `workflow` permissions
- Check token is added to both repositories
- Ensure repository names are correct in secrets

### Documentation not updating:
- Check Actions tab for error messages
- Verify Node.js version compatibility
- Ensure schema file exists and is readable

## 📞 Need Help?

- Check the detailed guide: `GITHUB_SETUP_GUIDE.md`
- Run the test script: `./test-pipeline.sh`
- Check GitHub Actions logs for specific error messages

