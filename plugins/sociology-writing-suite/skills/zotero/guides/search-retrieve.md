# Search & Retrieve

## Why This Phase Matters

Finding and accessing items is the foundation of library interaction. This phase covers effective search strategies and retrieving full item details with attachments.

---

## Search Strategies

### Basic Search

```
search_items(query="housing instability", limit=20)
```

Default behavior:
- Searches title, creator, and year fields
- Returns simplified item objects
- Sorted by relevance

### Search Modes (qmode)

| Mode | What It Searches | Speed | Use When |
|------|------------------|-------|----------|
| `titleCreatorYear` | Title, creators, year | Fast | Default, most searches |
| `everything` | All fields + full text | Slow | Need comprehensive results |

Example:
```
search_items(query="qualitative methods", qmode="everything")
```

### Filtering by Item Type

```
search_items(query="housing", item_type="journalArticle")
```

Common item types:
- `journalArticle`
- `book`
- `bookSection`
- `conferencePaper`
- `thesis`
- `report`
- `document`

To see all available types:
```
item_types()
```

### Tag Filtering

**Single tag**:
```
search_items(query="housing", tag="to-read")
```

**Multiple tags (AND logic)**:
```
search_items(query="housing", tag=["sociology", "qualitative"])
```

**OR logic**:
```
search_items(query="housing", tag="sociology OR anthropology")
```

**NOT logic** (exclude tag):
```
search_items(query="housing", tag="-review")
```

### Sorting

```
search_items(query="housing", sort="dateAdded", direction="desc")
```

Sort fields:
- `dateAdded`
- `dateModified`
- `title`
- `creator`
- `date` (publication date)

Directions: `asc` or `desc`

### Pagination

For large result sets:
```
# First page
search_items(query="sociology", limit=25, start=0)

# Second page
search_items(query="sociology", limit=25, start=25)
```

### Since Version

Get items modified since a version number:
```
search_items(query="housing", since=1234)
```

Useful for syncing or detecting changes.

---

## Retrieving Items

### Single Item with Details

```
get_item(item_key="ABC123XY", include_children=true)
```

Returns:
- Full item metadata (all fields)
- Children: attachments, notes, linked files

### Understanding the Response

```json
{
  "item": {
    "key": "ABC123XY",
    "data": {
      "itemType": "journalArticle",
      "title": "Housing Instability and Health",
      "creators": [...],
      "publicationTitle": "Social Forces",
      "date": "2024",
      "DOI": "10.1093/sf/xxx",
      "tags": [{"tag": "sociology"}, {"tag": "health"}],
      ...
    }
  },
  "children": [
    {
      "key": "PDF123",
      "data": {
        "itemType": "attachment",
        "title": "Full Text PDF",
        "filename": "Smith_2024.pdf",
        "linkMode": "imported_file"
      }
    }
  ]
}
```

### Simplified Search Results

`search_items` returns simplified objects:
```json
{
  "key": "ABC123XY",
  "itemType": "journalArticle",
  "title": "Housing Instability...",
  "creators": [...],
  "date": "2024",
  "tags": [...]
}
```

Use `get_item` to get full details when needed.

---

## Browse Operations

### Top-Level Items

Get items that aren't attachments or notes:
```
top_items(limit=50)
```

### Items in Trash

```
trash_items()
```

### Deleted Items

For permanently deleted items (requires version):
```
deleted_items(since=1234)
```

---

## Collection-Based Retrieval

### List Collections

```
list_collections()
```

### Top-Level Collections Only

```
list_collections_top()
```

### Items in a Collection

```
collection_items(collection_key="COLL123")
```

With search filter:
```
collection_items(collection_key="COLL123", q="housing", qmode="titleCreatorYear")
```

### Top-Level Items in Collection

Excludes notes and attachments:
```
collection_items_top(collection_key="COLL123")
```

---

## Working with Tags

### All Tags in Library

```
list_tags()
```

### Tags for Specific Item

```
item_tags(item_key="ABC123XY")
```

### Tags in a Collection

```
collection_tags(collection_key="COLL123")
```

---

## Search Workflow Example

**Goal**: Find sociology articles about housing from the last 5 years.

1. **Broad search**:
   ```
   search_items(query="housing", item_type="journalArticle", limit=50)
   ```

2. **Narrow with tags**:
   ```
   search_items(query="housing", item_type="journalArticle", tag="sociology")
   ```

3. **Get details for promising item**:
   ```
   get_item(item_key="ABC123XY", include_children=true)
   ```

4. **Check for PDF**:
   Look in `children` for `itemType: "attachment"` with `filename` ending in `.pdf`.

---

## Best Practices

1. **Start broad, then narrow**: Begin with general search, add filters as needed.

2. **Use `titleCreatorYear` first**: It's faster. Switch to `everything` only if needed.

3. **Leverage collections**: If papers are organized in collections, search within them.

4. **Tag strategically**: Use tags like "to-read", "priority", "theoretical" for workflow.

5. **Get full item for citations**: Use `get_item` when you need all metadata fields.

---

## When You're Done

Report search results:
- Number of items found
- Key items identified
- Availability of attachments

Example:
> "Found 23 articles matching 'housing instability' + 'sociology' tag. Top result: Smith 2024 'Housing Instability and Health' (has PDF attached). Retrieved full metadata for citation."
