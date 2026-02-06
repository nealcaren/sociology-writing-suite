# Tool Reference

Complete parameter documentation for all MCP Zotero tools.

---

## Search & Retrieve

### search_items

Search items by free-text query.

```
search_items(
  query: str,           # Required: search query
  limit: int = 20,      # Max results (1-100)
  start: int = 0,       # Offset for pagination
  item_type: str,       # Filter by itemType
  qmode: str,           # "titleCreatorYear" or "everything"
  tag: str | list,      # Tag filter (see below)
  sort: str,            # Sort field
  direction: str,       # "asc" or "desc"
  since: int            # Return items since this version
)
```

**Tag parameter**:
- String: `"sociology"` - single tag
- String with OR: `"sociology OR anthropology"`
- String with NOT: `"-review"` (exclude tag)
- List: `["sociology", "qualitative"]` - AND logic

**Sort fields**: `dateAdded`, `dateModified`, `title`, `creator`, `date`

**Returns**: `{query, count, items: [simplified items]}`

---

### get_item

Retrieve a single item with optional children.

```
get_item(
  item_key: str,           # Required: Zotero item key
  include_children: bool = true
)
```

**Returns**: `{item: full item, children: [attachments, notes]}`

---

### top_items

Retrieve top-level items (not attachments/notes).

```
top_items(
  q: str,               # Search query
  qmode: str,           # Search mode
  limit: int,           # Max results
  start: int,           # Offset
  item_type: str,       # Filter by type
  tag: str | list,      # Tag filter
  sort: str,            # Sort field
  direction: str,       # Sort direction
  since: int            # Version filter
)
```

**Returns**: `{count, items: [full items]}`

---

### trash_items

Retrieve items in trash.

```
trash_items(
  # Same parameters as top_items
)
```

---

### deleted_items

Retrieve deleted items (requires since parameter).

```
deleted_items(
  since: int,           # Required for meaningful results
  # Same parameters as top_items
)
```

---

### ping

Basic liveness check.

```
ping()
```

**Returns**: `{ok: true, server: "zotero"}`

---

### health_check

Validate configuration without API calls.

```
health_check()
```

**Returns**: `{ok: bool, missing: [env vars], local: bool}`

---

## Collections

### list_collections

Retrieve all collections.

```
list_collections(
  q: str,               # Search query
  qmode: str,           # Search mode
  limit: int,           # Max results
  start: int,           # Offset
  item_type: str,       # Not typically used
  tag: str | list,      # Not typically used
  sort: str,            # Sort field
  direction: str,       # Sort direction
  since: int            # Version filter
)
```

**Returns**: `{count, collections: [collection objects]}`

---

### list_collections_top

Retrieve top-level collections only.

```
list_collections_top(
  # Same parameters as list_collections
)
```

---

### list_collections_sub

Retrieve subcollections of a collection.

```
list_collections_sub(
  collection_key: str   # Required: parent collection key
)
```

---

### get_collection

Retrieve a single collection.

```
get_collection(
  collection_key: str   # Required
)
```

**Returns**: `{collection: collection object}`

---

### collection_items

Retrieve items in a collection.

```
collection_items(
  collection_key: str,  # Required
  q: str,               # Search within collection
  qmode: str,
  limit: int,
  start: int,
  item_type: str,
  tag: str | list,
  sort: str,
  direction: str,
  since: int
)
```

---

### collection_items_top

Retrieve top-level items in a collection (excludes attachments/notes).

```
collection_items_top(
  collection_key: str,  # Required
  # Same parameters as collection_items
)
```

---

### collection_tags

Retrieve tags used within a collection.

```
collection_tags(
  collection_key: str   # Required
)
```

---

### create_collections

Create new collections. **Web API only**.

```
create_collections(
  collections: [
    {name: str, parentCollection: str}  # parentCollection is optional
  ]
)
```

**Example**:
```
create_collections(collections=[
  {"name": "Theory"},
  {"name": "Methods", "parentCollection": "PARENT123"}
])
```

---

## Tags

### list_tags

Retrieve all tags in library.

```
list_tags(
  q: str,               # Search tags
  qmode: str,
  limit: int,
  start: int,
  item_type: str,       # Filter by item type
  tag: str | list,
  sort: str,
  direction: str,
  since: int
)
```

---

### item_tags

Retrieve tags for a specific item.

```
item_tags(
  item_key: str         # Required
)
```

---

## Metadata

### item_types

Get available item types.

```
item_types()
```

**Returns**: `{item_types: [{itemType, localized}]}`

---

### item_fields

Get all available item fields.

```
item_fields()
```

---

### item_type_fields

Get fields available for a specific item type.

```
item_type_fields(
  item_type: str        # Required
)
```

---

### creator_fields

Get creator field options.

```
creator_fields()
```

---

### item_creator_types

Get creator types for an item type.

```
item_creator_types(
  item_type: str        # Required
)
```

---

### item_attachment_link_modes

Get attachment link mode options.

```
item_attachment_link_modes()
```

---

## Item Operations

### add_item

Create a new item. **Web API only**.

```
add_item(
  item_type: str,       # Required: e.g., "journalArticle"
  fields: dict = {},    # Item fields
  attachment_paths: list = []  # Optional file paths
)
```

**Fields structure** depends on item type. Common fields:
- `title`
- `creators`: `[{creatorType, firstName, lastName}]` or `[{creatorType, name}]`
- `date`
- `tags`: `[{tag: str}]`
- `abstractNote`
- `DOI`, `ISBN`, `ISSN`
- `url`

---

### update_item

Modify fields on an existing item. **Web API only**.

```
update_item(
  item_key: str,        # Required
  fields: dict          # Fields to update
)
```

Only specified fields are modified.

---

### delete_item

Delete an item. **Web API only**.

```
delete_item(
  item_key: str         # Required
)
```

---

## Collection Management

### update_collection

Update collection name or parent. **Web API only**.

```
update_collection(
  collection_key: str,  # Required
  name: str,            # New name
  parentCollection: str # New parent (empty string for top-level)
)
```

---

### delete_collection

Delete a collection. **Web API only**.

```
delete_collection(
  collection_key: str   # Required
)
```

Items in the collection are NOT deleted.

---

### add_item_to_collection

Add item to a collection. **Web API only**.

```
add_item_to_collection(
  collection_key: str,  # Required
  item_key: str         # Required
)
```

---

### remove_item_from_collection

Remove item from a collection. **Web API only**.

```
remove_item_from_collection(
  collection_key: str,  # Required
  item_key: str         # Required
)
```

Item remains in library.

---

## Saved Searches & Tags

### list_searches

Retrieve saved searches.

```
list_searches(
  # Same parameters as list_collections
)
```

---

### create_saved_search

Create a saved search. **Web API only**.

```
create_saved_search(
  name: str,            # Required
  conditions: [         # Required: list of conditions
    {
      condition: str,   # Field to match
      operator: str,    # How to match
      value: str        # Value to match
    }
  ]
)
```

**Conditions**: `itemType`, `title`, `creator`, `tag`, `dateAdded`, `dateModified`, `date`, `collection`

**Operators**: `is`, `isNot`, `contains`, `doesNotContain`, `beginsWith`, `isLessThan`, `isGreaterThan`, `isBefore`, `isAfter`

---

### delete_saved_search

Delete saved searches. **Web API only**.

```
delete_saved_search(
  keys: list            # Required: list of search keys
)
```

---

### delete_tags

Delete tags from library. **Web API only**.

```
delete_tags(
  tags: list            # Required: list of tag names
)
```

Removes tags from all items.

---

## Attachments

### download_attachments

Download file attachments to local disk.

```
download_attachments(
  item_key: str,        # Required: parent item key
  overwrite: bool = false
)
```

**Returns**: `{item_key, saved: [file paths or ERROR:key:message]}`

Files saved to: `$ZOTERO_ATTACHMENTS_DIR/item_key/filename`

---

### attach_file

Upload file as stored attachment. **Web API only**.

```
attach_file(
  item_key: str,        # Required: parent item key
  file_path: str,       # Required: local file path
  title: str            # Optional: attachment title
)
```

Auto-falls back to linked file on 413 (quota exceeded).

---

### attach_linked_file

Create linked file attachment (no upload). **Web API only**.

```
attach_linked_file(
  item_key: str,        # Required: parent item key
  file_path: str,       # Required: local file path
  title: str            # Optional: attachment title
)
```

---

## Other

### list_groups

Retrieve user's groups.

```
list_groups(
  # Same parameters as list_collections
)
```
