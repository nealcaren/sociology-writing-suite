---
name: zotero-rag
description: Semantic search for Zotero libraries using RAG. Use when users want to search their Zotero library by meaning (not keywords), find relevant passages across PDFs, discover thematic connections between sources, get expanded context around quotes, or find similar passages across documents. Triggers on queries like "find passages about X in my library", "search my Zotero for themes of Y", "what do my sources say about Z", "find similar discussions", or "get more context around this quote".
---

# Zotero RAG: Semantic Search

Search your Zotero library by meaning using the mcp-zotero-rag MCP server tools.

## Tools

| Tool | Purpose |
|------|---------|
| `index_library` | Index all items or a collection |
| `index_items` | Index specific items by key |
| `semantic_search` | Find passages by meaning |
| `get_chunk_context` | Expand result with surrounding text |
| `find_similar_chunks` | Find related passages across documents |
| `index_status` | Check index statistics |
| `list_indexed_items` | See what's indexed |
| `remove_from_index` | Remove items from index |
| `health_check` | Validate configuration |

## Workflows

### First Use

1. `health_check` - verify Zotero connection
2. `index_library` with `collection_key` - index a collection
3. Or `index_items` with `item_keys` - index specific items

### Search → Explore → Connect

```
semantic_search query="resource mobilization in social movements"
```

Returns ranked passages with score, chunk_id, item_key, section_title, text.

```
get_chunk_context chunk_id="ABC123_5" context_lines=20
```

Expands the result with surrounding lines from the source.

```
find_similar_chunks chunk_id="ABC123_5" limit=5
```

Finds related discussions across other documents.

## Search Tips

**Conceptual queries work best:**
- ✓ "how organizations maintain legitimacy under pressure"
- ✗ "legitimacy organization"

**Filter options:**
- `collection_key` - limit to a collection
- `item_keys` - limit to specific items
- `chunk_types` - "abstract", "body", "chapter"
- `min_score` - similarity threshold (0-1)

## Notes

- Indexing extracts text from PDFs/EPUBs and creates embeddings
- Re-running `index_library` skips unchanged documents
- Use `force_reindex=true` to re-process everything
- Index persists at `~/.zotero-rag`
