# GitHub Documentation Pipeline Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    MAIN REPOSITORY                             │
│                 (GraphQl-players)                               │
├─────────────────────────────────────────────────────────────────┤
│  📁 src/main/resources/graphql/schema.graphql                  │
│  📁 .github/workflows/update-docs.yml                          │
│  🔐 Secrets: DOCS_REPO_TOKEN, DOCS_REPO_NAME                  │
└─────────────────────────────────────────────────────────────────┘
                                │
                                │ Schema Change Detected
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                    GITHUB ACTIONS                               │
│                 (Main Repository)                               │
├─────────────────────────────────────────────────────────────────┤
│  1. Checkout main repo                                          │
│  2. Setup Node.js                                              │
│  3. Generate documentation using graphql-markdown             │
│  4. Send repository dispatch event                             │
└─────────────────────────────────────────────────────────────────┘
                                │
                                │ Repository Dispatch
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                DOCUMENTATION REPOSITORY                         │
│                 (graphql-api-docs)                             │
├─────────────────────────────────────────────────────────────────┤
│  📁 .github/workflows/update-docs.yml                         │
│  📁 docs/graphql/schema-documentation.md                      │
│  📁 docs/versions/schema-v*.md                                 │
│  🔐 Secret: MAIN_REPO_TOKEN                                    │
└─────────────────────────────────────────────────────────────────┘
                                │
                                │ Documentation Updated
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                    GITHUB ACTIONS                               │
│               (Documentation Repository)                        │
├─────────────────────────────────────────────────────────────────┤
│  1. Receive repository dispatch event                          │
│  2. Checkout both repositories                                 │
│  3. Generate updated documentation                            │
│  4. Update docs files and create versioned copies             │
│  5. Commit and push changes                                    │
└─────────────────────────────────────────────────────────────────┘
```

## Flow Description:

1. **Developer modifies** `src/main/resources/graphql/schema.graphql`
2. **Main repository workflow** detects the change via `paths` filter
3. **Documentation generation** using `graphql-markdown` tool
4. **Repository dispatch** sent to documentation repository
5. **Documentation repository** receives the event
6. **Documentation updated** with new schema information
7. **Versioned copies** created for historical tracking
8. **Changes committed** and pushed to documentation repository

## Key Benefits:

- ✅ **Automatic Updates**: No manual intervention required
- ✅ **Version Control**: Complete history of documentation changes
- ✅ **Separation of Concerns**: Documentation separate from code
- ✅ **Audit Trail**: Full tracking of who changed what when
- ✅ **Reliability**: Uses GitHub's native repository dispatch feature
- ✅ **Scalability**: Can handle multiple schema files and branches

