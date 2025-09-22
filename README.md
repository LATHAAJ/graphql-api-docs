# GraphQL API Documentation Repository

This repository contains automatically generated documentation for the GraphQL API.

## Repository Structure

After cleanup, this repository should contain only the essential files:

### Core Files
- `index.html` - Main documentation website
- `package.json` - Node.js dependencies for documentation generation
- `package-lock.json` - Locked dependency versions

### Documentation
- `docs/` - Main documentation directory
  - `graphql/schema-documentation.md` - Current GraphQL schema documentation
  - `graphql/schema-documentation.html` - HTML version of schema documentation
  - `schema-documentation.md` - Main schema documentation
  - `schema-documentation-preview.md` - Preview version
  - `schema-documentation-with-descriptions.md` - Detailed version with descriptions

### Configuration
- `DOCUMENTATION.md` - Documentation generation instructions

## How it works

This documentation is automatically updated whenever the GraphQL schema changes in the main repository. The update is triggered by a repository dispatch event from the main GraphQL-players repository.

## Manual Update

If you need to manually trigger a documentation update, you can:

1. Go to the main repository (GraphQl-players)
2. Navigate to Actions tab
3. Run the "Trigger Documentation Update" workflow

## Cleanup

The following files have been removed during cleanup:
- Duplicate schema documentation files
- Setup and test scripts
- Redundant documentation files
- Temporary workflow files
- gh-pages directory (handled automatically by GitHub Pages)

## GitHub Pages

This repository is configured to serve documentation via GitHub Pages using the `docs/` directory as the source.
