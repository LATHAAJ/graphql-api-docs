# GitHub Personal Access Token Setup

## Step 1: Create Personal Access Token

1. **Go to GitHub Settings:**
   - Click your profile picture → Settings
   - Or go directly to: https://github.com/settings/tokens

2. **Navigate to Developer Settings:**
   - Scroll down and click "Developer settings" (left sidebar)
   - Click "Personal access tokens" → "Tokens (classic)"

3. **Generate New Token:**
   - Click "Generate new token" → "Generate new token (classic)"
   - Give it a descriptive name: `GraphQL Docs Automation`
   - Set expiration: `90 days` (or your preference)

4. **Select Scopes:**
   - ✅ `repo` (Full control of private repositories)
   - ✅ `workflow` (Update GitHub Action workflows)
   - ✅ `write:packages` (if you plan to use packages)

5. **Generate and Copy:**
   - Click "Generate token"
   - **IMPORTANT:** Copy the token immediately (you won't see it again)
   - Save it securely (password manager recommended)

## Step 2: Create Documentation Repository

### Option A: Using GitHub Web Interface

1. **Go to GitHub:**
   - Click the "+" icon → "New repository"
   - Or go to: https://github.com/new

2. **Repository Settings:**
   - **Repository name:** `graphql-api-docs` (or your preferred name)
   - **Description:** `Automatically generated GraphQL API documentation`
   - **Visibility:** Public (recommended for documentation)
   - ✅ Add a README file
   - ✅ Add .gitignore (Node)
   - ✅ Choose a license (MIT recommended)

3. **Create Repository:**
   - Click "Create repository"

### Option B: Using GitHub CLI (if you have it installed)

```bash
# Create the repository
gh repo create graphql-api-docs --public --description "Automatically generated GraphQL API documentation" --add-readme

# Clone it locally
git clone https://github.com/YOUR_USERNAME/graphql-api-docs.git
cd graphql-api-docs
```

## Step 3: Set Up Repository Structure

Once you've created the repository, you need to set up the proper structure:

### Create Directory Structure:
```bash
mkdir -p .github/workflows
mkdir -p docs/graphql
mkdir -p docs/versions
```

### Add the Workflow File:
Copy the content from `docs-repo-workflow.yml` to `.github/workflows/update-docs.yml`

### Add Initial README:
Copy the content from `docs-repo-readme.md` to `README.md`

## Step 4: Configure Secrets

### In Main Repository (GraphQl-players):
1. Go to: https://github.com/YOUR_USERNAME/GraphQl-players/settings/secrets/actions
2. Click "New repository secret"
3. Add these secrets:
   - **Name:** `DOCS_REPO_TOKEN`
     **Value:** [Your personal access token]
   - **Name:** `DOCS_REPO_NAME`
     **Value:** `YOUR_USERNAME/graphql-api-docs`

### In Documentation Repository:
1. Go to: https://github.com/YOUR_USERNAME/graphql-api-docs/settings/secrets/actions
2. Click "New repository secret"
3. Add this secret:
   - **Name:** `MAIN_REPO_TOKEN`
     **Value:** [Your personal access token]

## Step 5: Test the Setup

1. **Make a test change** to your GraphQL schema
2. **Commit and push** the changes
3. **Check Actions tab** in both repositories
4. **Verify documentation** is updated in the docs repository

## Troubleshooting

### Common Issues:

1. **"Repository not found":**
   - Check `DOCS_REPO_NAME` secret format: `username/repo-name`
   - Ensure the docs repository exists and is accessible

2. **"Permission denied":**
   - Verify token has `repo` and `workflow` permissions
   - Check token is added to both repositories

3. **Workflow not triggering:**
   - Ensure workflow files are in `.github/workflows/` directory
   - Check file extensions are `.yml` not `.yaml`
   - Verify the `paths` filter includes your schema file

4. **Documentation not updating:**
   - Check Actions tab for error messages
   - Verify Node.js version compatibility
   - Ensure schema file path is correct

## Security Best Practices

- Use minimal required permissions for the token
- Set appropriate expiration dates
- Regularly rotate your access tokens
- Consider using GitHub Apps for production environments
- Never commit tokens to your repository

