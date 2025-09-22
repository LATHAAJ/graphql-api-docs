# Repository Dispatch Setup Instructions

## Overview
This setup creates an automated documentation pipeline using GitHub's Repository Dispatch feature. When you modify the GraphQL schema in your main repository, it automatically updates the documentation in a separate repository.

## Step 1: Create Documentation Repository

1. Create a new repository on GitHub (e.g., `your-username/graphql-api-docs`)
2. Initialize it with a README
3. Copy the workflow file from `docs-repo-workflow.yml` to `.github/workflows/update-docs.yml` in the new repository

## Step 2: Create Personal Access Token

1. Go to GitHub Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Click "Generate new token (classic)"
3. Give it a name like "GraphQL Docs Automation"
4. Select these scopes:
   - `repo` (Full control of private repositories)
   - `workflow` (Update GitHub Action workflows)
5. Click "Generate token"
6. **Copy the token immediately** (you won't see it again)

## Step 3: Configure Secrets

### In Main Repository (GraphQl-players):
1. Go to Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Add these secrets:
   - **Name:** `DOCS_REPO_TOKEN`
     **Value:** [Your personal access token]
   - **Name:** `DOCS_REPO_NAME`
     **Value:** `your-username/graphql-api-docs` (replace with your actual docs repo name)

### In Documentation Repository:
1. Go to Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Add this secret:
   - **Name:** `MAIN_REPO_TOKEN`
     **Value:** [Your personal access token]

## Step 4: Test the Pipeline

1. Make a small change to your GraphQL schema file
2. Commit and push the changes
3. Check the Actions tab in both repositories to see the workflows running
4. Verify that the documentation is updated in the docs repository

## File Structure

### Main Repository (GraphQl-players):
```
.github/
└── workflows/
    └── update-docs.yml          # Triggers docs update
src/main/resources/graphql/
└── schema.graphql              # Your GraphQL schema
```

### Documentation Repository:
```
.github/
└── workflows/
    └── update-docs.yml         # Receives dispatch and updates docs
docs/
├── graphql/
│   └── schema-documentation.md # Current documentation
└── versions/
    └── schema-v*.md            # Versioned documentation
README.md                       # Auto-generated README
```

## Troubleshooting

### Common Issues:

1. **"Repository not found" error:**
   - Check that `DOCS_REPO_NAME` secret is correct
   - Ensure the docs repository exists and is accessible

2. **"Permission denied" error:**
   - Verify the personal access token has the correct permissions
   - Check that the token is added to both repositories

3. **Workflow not triggering:**
   - Ensure the workflow file is in `.github/workflows/` directory
   - Check that the file has `.yml` extension
   - Verify the `paths` filter includes your schema file

4. **Documentation not updating:**
   - Check the Actions tab for error messages
   - Verify Node.js version compatibility
   - Ensure the schema file path is correct

## Advanced Configuration

### Custom Documentation Format:
You can modify the `npx graphql-markdown` command in both workflows to customize the output format:

```bash
npx graphql-markdown ./src/main/resources/graphql/schema.graphql \
  --title "My Custom Title" \
  --prologue "Custom introduction text" \
  --epilogue "Custom footer text"
```

### Multiple Schema Files:
To monitor multiple schema files, update the `paths` section in the main workflow:

```yaml
on:
  push:
    paths:
      - 'src/main/resources/graphql/schema.graphql'
      - 'src/main/resources/graphql/other-schema.graphql'
```

### Branch-Specific Documentation:
To generate different documentation for different branches, modify the client-payload to include branch information and handle it in the docs repository workflow.

## Security Notes

- Keep your personal access token secure
- Consider using GitHub Apps for production environments
- Regularly rotate your access tokens
- Use minimal required permissions for the token

