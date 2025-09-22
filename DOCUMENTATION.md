# GraphQL Documentation Generation - Java Alternatives

This project provides **multiple Java-native alternatives** to generate GraphQL documentation without requiring Node.js dependencies.

## 🚀 Available Options

### **Option 1: Gradle Tasks (Simplest)**

```bash
# Copy schema to build directory
./gradlew generateGraphQLDocs

# Generate Markdown documentation using Java
./gradlew generateMarkdownDocs
```

### **Option 2: REST API Endpoints**

Start your Spring Boot application and use these endpoints:

```bash
# Start the application
./gradlew bootRun

# Generate documentation via REST API
curl http://localhost:8080/api/docs/generate

# Get documentation info
curl http://localhost:8080/api/docs/info
```

### **Option 3: Command Line Runner**

```bash
# Generate documentation and exit
java -jar build/libs/demo-0.0.1-SNAPSHOT.jar --generate-docs
```

### **Option 4: Interactive GraphiQL**

```bash
# Start the application
./gradlew bootRun

# Open browser to: http://localhost:8080/graphiql
```

## 📁 Generated Files

- **`docs/schema-documentation.md`** - Complete Markdown documentation
- **`build/docs/schema.graphqls`** - Raw schema file
- **Interactive GraphiQL** - Available at `/graphiql`

## 🛠️ What's Generated

The Java documentation generator creates comprehensive Markdown documentation in **GitHub GraphQL API style** including:

- **📋 Table of Contents** - Navigation links to all sections
- **ℹ️ About Section** - API overview and endpoints
- **🔍 Queries Documentation** - All queries with detailed argument tables
- **✏️ Mutations Documentation** - All mutations with parameter descriptions
- **📊 Types Documentation** - All GraphQL types with field descriptions
- **📝 Enums Documentation** - All enum values with detailed descriptions
- **💡 Example Queries** - Ready-to-use GraphQL examples

### 📄 Sample Output Structure

The generated documentation follows the same structure as [GitHub's GraphQL API documentation](https://docs.github.com/en/graphql/reference/queries):

```markdown
# GraphQL API Documentation

## In this article
* [About the API](#about-the-api)
* [Queries](#queries)
* [Mutations](#mutations)
* [Types](#types)
* [Enums](#enums)

## Queries
### findAll
Retrieve all cricket players in the system.
**Type:** `[Player]`

### findPlayerById
Look up a specific player by their unique identifier.
**Type:** `Player`

#### Arguments for `findPlayerById`
| Name | Type | Description |
|------|------|-------------|
| id | `ID!` | The unique identifier of the object. |
```

**Preview:** See `docs/schema-documentation-with-descriptions.md` for the complete generated format!

## 🎯 **Enhanced: Schema-Driven Descriptions**

**✅ YES!** The enhanced documentation generator now extracts descriptions directly from your GraphQL schema using the standard GraphQL description syntax:

```graphql
"""
Represents a cricket player with their basic information, team affiliation, and role.
"""
type Player {
    """Unique identifier for the player"""
    id: ID!
    """The name of the player"""
    name: String!
    """The team the player belongs to"""
    team: Team!
}
```

### 🔧 **How It Works:**

1. **Schema Descriptions** - Add descriptions using `"""description"""` syntax
2. **Automatic Extraction** - Java generator parses and extracts descriptions
3. **Professional Output** - Generates GitHub-style documentation with real descriptions
4. **No Hardcoding** - All descriptions come from your schema, not Java code

### 📝 **Benefits:**

✅ **Schema-Driven** - Descriptions live in your GraphQL schema  
✅ **Standard Compliant** - Uses official GraphQL description syntax  
✅ **Auto-Sync** - Documentation updates when schema changes  
✅ **Professional Quality** - Matches GitHub GraphQL API documentation style  
✅ **Maintainable** - Single source of truth for all descriptions

## 🔧 Customization

You can customize the documentation generator by modifying:
- `GraphQLDocumentationGenerator.java` - Main generation logic
- `DocumentationController.java` - REST API endpoints
- `build.gradle.kts` - Gradle tasks

## 🌟 Benefits of Java-Native Approach

✅ **No Node.js Required** - Pure Java solution  
✅ **Integrated with Spring Boot** - Seamless integration  
✅ **Gradle Integration** - Build-time documentation generation  
✅ **REST API Access** - Generate docs via HTTP endpoints  
✅ **Customizable** - Full control over output format  
✅ **Interactive GraphiQL** - Built-in GraphQL playground  

## 📊 Comparison with Node.js Tools

| Feature | Java Native | Node.js Tools |
|---------|-------------|---------------|
| Dependencies | None (Java only) | Requires Node.js |
| Integration | Native Spring Boot | External process |
| Customization | Full Java control | Limited by tool |
| Build Integration | Gradle tasks | npm scripts |
| Performance | Fast (JVM) | Slower (Node.js) |

## 🎯 Recommended Usage

1. **Development**: Use GraphiQL (`/graphiql`) for interactive exploration
2. **CI/CD**: Use Gradle tasks (`./gradlew generateMarkdownDocs`)
3. **API Integration**: Use REST endpoints (`/api/docs/generate`)
4. **Documentation**: Share generated `docs/schema-documentation.md`

This approach gives you **complete control** over your GraphQL documentation generation while staying within the Java ecosystem!
