---
name: mcp-zotero
description: Operate Zotero libraries through the MCP server. Search, retrieve, organize, create items, manage collections and tags, and handle file attachments with automatic linked-file fallback for storage quota limits.
metadata:
  short-description: Zotero library operations via MCP
---

# MCP Zotero

Use this skill when you need to interact with a Zotero library through Claude Code. This skill provides comprehensive access to Zotero's reference management capabilities: searching and retrieving items, organizing with collections and tags, creating and modifying items, and managing file attachments.

## When to Use This Skill

Use this skill when:
- Searching for papers in a Zotero library
- Retrieving metadata and attachments for specific items
- Organizing items into collections
- Adding tags to items
- Creating new bibliography entries
- Attaching files (PDFs, notes) to items
- Managing library structure (collections, saved searches)
- Integrating Zotero with other research workflows

## Key Concepts

### Hybrid API Mode

The server automatically uses the best API for each operation:

| Operation | API Used | Requirements |
|-----------|----------|--------------|
| **Reads** (search, get) | Local API | Zotero app running |
| **Writes** (create, update, attach) | Web API | `ZOTERO_API_KEY` |

This gives you fast local reads with full write capability. Just set `ZOTERO_LOCAL=true` and have both `ZOTERO_LOCAL_KEY` and `ZOTERO_API_KEY` in your environment.

### Attachments: Stored vs Linked

Zotero supports two attachment types:

| Type | Storage | When to Use |
|------|---------|-------------|
| **Stored** | Uploaded to Zotero | Small files, sync across devices |
| **Linked** | Path to local file | Large files, avoid storage quota |

**Recommended**: Use `attach_linked_file` for reliability. Uploads via `attach_file` can fail silently due to quota or size limits.

---

## Tool Categories

### Search & Retrieve (7 tools)
| Tool | Purpose |
|------|---------|
| `search_items` | Free-text search with filters |
| `get_item` | Single item with optional children |
| `top_items` | Top-level items (not attachments) |
| `trash_items` | Items in trash |
| `deleted_items` | Permanently deleted (requires version) |
| `ping` | Liveness check |
| `health_check` | Configuration validation |

### Collections (8 tools)
| Tool | Purpose |
|------|---------|
| `list_collections` | All collections |
| `list_collections_top` | Top-level collections only |
| `list_collections_sub` | Subcollections of a collection |
| `get_collection` | Single collection details |
| `collection_items` | Items in a collection |
| `collection_items_top` | Top-level items in collection |
| `collection_tags` | Tags used in collection |
| `create_collections` | Create new collections (Web API) |

### Tags (2 tools)
| Tool | Purpose |
|------|---------|
| `list_tags` | All tags in library |
| `item_tags` | Tags for specific item |

### Metadata (6 tools)
| Tool | Purpose |
|------|---------|
| `item_types` | Available item types |
| `item_fields` | Available item fields |
| `item_type_fields` | Fields for specific type |
| `creator_fields` | Creator field options |
| `item_creator_types` | Creator types for item type |
| `item_attachment_link_modes` | Attachment mode options |

### Item Operations (3 tools)
| Tool | Purpose |
|------|---------|
| `add_item` | Create new item (Web API) |
| `update_item` | Modify item fields (Web API) |
| `delete_item` | Delete item (Web API) |

### Collection Management (4 tools)
| Tool | Purpose |
|------|---------|
| `update_collection` | Rename or move collection (Web API) |
| `delete_collection` | Delete collection (Web API) |
| `add_item_to_collection` | Add item to collection (Web API) |
| `remove_item_from_collection` | Remove item (Web API) |

### Saved Searches & Tags (3 tools)
| Tool | Purpose |
|------|---------|
| `create_saved_search` | Create saved search (Web API) |
| `delete_saved_search` | Delete saved searches (Web API) |
| `delete_tags` | Delete tags (Web API) |

### Attachments (3 tools)
| Tool | Purpose |
|------|---------|
| `download_attachments` | Download item's attachments to disk |
| `attach_file` | Upload file (falls back to linked) (Web API) |
| `attach_linked_file` | Link local file without upload (Web API) |

### Other (2 tools)
| Tool | Purpose |
|------|---------|
| `list_searches` | Saved searches |
| `list_groups` | User's groups |

---

## Guides

Detailed guides for common operations. See the `guides/` directory:

| Guide | When to Use |
|-------|-------------|
| **[Setup](guides/setup.md)** | Configure MCP server, validate connection |
| **[Search & Retrieve](guides/search-retrieve.md)** | Find and read items in library |
| **[Library Management](guides/library-management.md)** | Organize with collections and tags |
| **[Item Creation](guides/item-creation.md)** | Add new items to library |
| **[Attachments](guides/attachments.md)** | Handle files and PDFs |

---

## Quick Start Examples

### Search for Papers

```
search_items(query="housing instability", qmode="titleCreatorYear", limit=20)
```

Search modes:
- `titleCreatorYear`: Fast, searches title/creator/year (default)
- `everything`: Full-text search (slower)

### Tag Filtering

```
# Single tag
search_items(query="housing", tag="to-read")

# Multiple tags (AND)
search_items(query="housing", tag=["sociology", "qualitative"])

# OR/NOT syntax
search_items(query="housing", tag="sociology OR anthropology")
search_items(query="housing", tag="-review")  # NOT review
```

### Retrieve Item with Attachments

```
get_item(item_key="ABC123XY", include_children=true)
```

The `children` field includes attachments, notes, and linked files.

### Create Item

```
add_item(
  item_type="journalArticle",
  fields={
    "title": "Housing Instability and Health",
    "creators": [{"creatorType": "author", "firstName": "Jane", "lastName": "Smith"}],
    "publicationTitle": "Social Forces",
    "date": "2024"
  }
)
```

### Attach PDF

**Recommended pattern**: Create item first, then attach separately.

```
# Step 1: Create item
result = add_item(item_type="journalArticle", fields={...})
item_key = result["created"]["successful"]["0"]["key"]

# Step 2: Attach as linked file (reliable, no storage limits)
attach_linked_file(item_key=item_key, file_path="/path/to/paper.pdf")
```

**Alternative**: Try upload, fall back to linked if it fails.

```
# Try stored attachment (uploads to Zotero storage)
attach_file(item_key="ABC123XY", file_path="/path/to/paper.pdf")

# If upload fails (quota/size), use linked instead
attach_linked_file(item_key="ABC123XY", file_path="/path/to/paper.pdf")
```

**Note**: `add_item` with `attachment_paths` may fail silently on upload. Always verify attachments or use the two-step pattern.

### Organize with Collections

```
# Create collection
create_collections(collections=[{"name": "Lit Review 2024"}])

# Add item to collection
add_item_to_collection(collection_key="COLL123", item_key="ABC123XY")

# List items in collection
collection_items(collection_key="COLL123")
```

---

## Configuration

### Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `ZOTERO_LIBRARY_ID` | Yes | Your Zotero user ID |
| `ZOTERO_LIBRARY_TYPE` | No | `user` (default) or `group` |
| `ZOTERO_LOCAL` | No | `true` (default) or `false` |
| `ZOTERO_LOCAL_KEY` | If local | Local API key from Zotero |
| `ZOTERO_API_KEY` | If web | API key from zotero.org |
| `ZOTERO_ATTACHMENTS_DIR` | No | Download directory |

### MCP Configuration

Add to your `.mcp.json`. Two options:

**Option 1: Inherit from environment (recommended)**

If credentials are in your shell profile (`~/.zshrc`, `~/.bashrc`):

```json
{
  "mcpServers": {
    "zotero": {
      "type": "stdio",
      "command": "uv",
      "args": ["run", "--project", "/path/to/mcp-zotero", "mcp-zotero"],
      "env": {
        "ZOTERO_LOCAL": "true"
      }
    }
  }
}
```

The server inherits `ZOTERO_LIBRARY_ID`, `ZOTERO_LOCAL_KEY`, etc. from your environment.

**Option 2: Explicit configuration**

```json
{
  "mcpServers": {
    "zotero": {
      "type": "stdio",
      "command": "uv",
      "args": ["run", "--project", "/path/to/mcp-zotero", "mcp-zotero"],
      "env": {
        "ZOTERO_LOCAL": "true",
        "ZOTERO_LIBRARY_ID": "YOUR_ID",
        "ZOTERO_LIBRARY_TYPE": "user",
        "ZOTERO_LOCAL_KEY": "YOUR_KEY"
      }
    }
  }
}
```

See [Setup Guide](guides/setup.md) for detailed configuration instructions.

### Enabling Local API in Zotero

1. Open Zotero desktop app
2. Go to **Edit > Preferences** (Windows/Linux) or **Zotero > Settings** (Mac)
3. Navigate to **Advanced > General**
4. Enable **"Allow other applications on this computer to communicate with Zotero"**
5. Set a local API key if prompted

---

## Integration with Other Skills

### With lit-search

Import papers found via OpenAlex:
1. Export BibTeX from lit-search
2. Import into Zotero
3. Use this skill to organize and annotate

### With lit-synthesis

Read papers for analysis:
1. Search for papers in collection
2. Use `get_item` to retrieve metadata
3. Use `download_attachments` to get PDFs for reading

### With reading-agent

Create structured notes:
1. Get item metadata via `get_item`
2. Download PDF via `download_attachments`
3. Feed to reading-agent for note creation

### With argument-builder

Support citation:
1. Search for relevant papers
2. Retrieve metadata for citations
3. Organize supporting references in collections

---

## Error Patterns & Fixes

| Error | Cause | Fix |
|-------|-------|-----|
| "Write operations require ZOTERO_LOCAL=false" | Trying to write in local mode | Set `ZOTERO_LOCAL=false` and provide `ZOTERO_API_KEY` |
| 413 (Entity Too Large) | Storage quota exceeded | Use `attach_linked_file` or let automatic fallback handle it |
| "ZOTERO_LIBRARY_ID is required" | Missing config | Set environment variable |
| Empty search results | Wrong qmode or narrow query | Try `qmode="everything"` or broader terms |
| Item not found | Wrong key or item deleted | Verify key with `search_items` |

---

## References

- **[Tool Reference](references/tool-reference.md)**: Complete parameter documentation for all 43 tools
- **[Error Patterns](references/error-patterns.md)**: Detailed troubleshooting guide
- **[README.md](../../README.md)**: Setup and installation instructions
- **[server.py](../../server.py)**: Source code and implementation details

---

## Starting a Zotero Session

When a user wants to work with Zotero:

1. **Verify configuration**:
   > "Let me check your Zotero connection."
   > Run `health_check()` to validate setup.

2. **Clarify the task**:
   > "What do you need to do with Zotero? Search for papers, organize items, add new references, or something else?"

3. **Choose the right mode**:
   - Read-only tasks: Local API is fine
   - Write tasks: Need Web API configured

4. **Proceed with appropriate phase**:
   - Searching → Phase 1
   - Organizing → Phase 2
   - Creating → Phase 3
   - Files → Phase 4
