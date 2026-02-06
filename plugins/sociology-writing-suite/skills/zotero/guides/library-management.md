# Library Management

## Why This Phase Matters

Organizing a Zotero library with collections and tags enables efficient research workflows. This phase covers creating organizational structures, managing item membership, and maintaining a well-organized library.

**Note**: Write operations in this phase require Web API mode (`ZOTERO_LOCAL=false`).

---

## Collections

Collections are folders for organizing items. An item can belong to multiple collections.

### Viewing Collections

**All collections**:
```
list_collections()
```

**Top-level only**:
```
list_collections_top()
```

**Subcollections of a collection**:
```
list_collections_sub(collection_key="COLL123")
```

**Single collection details**:
```
get_collection(collection_key="COLL123")
```

### Creating Collections

**Single collection**:
```
create_collections(collections=[{"name": "Lit Review 2024"}])
```

**Nested collection** (child of existing):
```
create_collections(collections=[
  {"name": "Methods Papers", "parentCollection": "COLL123"}
])
```

**Multiple collections at once**:
```
create_collections(collections=[
  {"name": "Theory"},
  {"name": "Empirical"},
  {"name": "To Read"}
])
```

### Updating Collections

**Rename**:
```
update_collection(collection_key="COLL123", name="New Name")
```

**Move to different parent**:
```
update_collection(collection_key="COLL123", parentCollection="PARENT456")
```

**Move to top level** (remove parent):
```
update_collection(collection_key="COLL123", parentCollection="")
```

### Deleting Collections

```
delete_collection(collection_key="COLL123")
```

**Warning**: This deletes the collection but not the items inside. Items remain in the library.

---

## Managing Items in Collections

### Add Item to Collection

```
add_item_to_collection(collection_key="COLL123", item_key="ITEM456")
```

### Remove Item from Collection

```
remove_item_from_collection(collection_key="COLL123", item_key="ITEM456")
```

**Note**: This removes the item from the collection, not from the library.

### View Items in Collection

```
collection_items(collection_key="COLL123")
```

With filters:
```
collection_items(collection_key="COLL123", q="housing", item_type="journalArticle")
```

### View Tags in Collection

```
collection_tags(collection_key="COLL123")
```

---

## Tags

Tags provide flexible labeling that cuts across collections.

### Viewing Tags

**All tags in library**:
```
list_tags()
```

**Tags for specific item**:
```
item_tags(item_key="ITEM456")
```

**Tags in a collection**:
```
collection_tags(collection_key="COLL123")
```

### Adding Tags to Items

Tags are added through item updates:
```
update_item(item_key="ITEM456", fields={
  "tags": [
    {"tag": "sociology"},
    {"tag": "qualitative"},
    {"tag": "to-read"}
  ]
})
```

**Important**: This replaces all tags. To add to existing tags, first retrieve them:

```
# 1. Get current tags
item = get_item(item_key="ITEM456")
current_tags = item["item"]["data"]["tags"]

# 2. Add new tag
current_tags.append({"tag": "new-tag"})

# 3. Update
update_item(item_key="ITEM456", fields={"tags": current_tags})
```

### Deleting Tags

Delete tags from the entire library:
```
delete_tags(tags=["obsolete-tag", "old-tag"])
```

**Warning**: This removes the tags from all items that have them.

---

## Saved Searches

Saved searches are persistent queries that can be accessed later.

### Viewing Saved Searches

```
list_searches()
```

### Creating Saved Searches

```
create_saved_search(
  name="Recent Sociology Articles",
  conditions=[
    {"condition": "itemType", "operator": "is", "value": "journalArticle"},
    {"condition": "tag", "operator": "is", "value": "sociology"},
    {"condition": "dateAdded", "operator": "isAfter", "value": "2024-01-01"}
  ]
)
```

Common condition types:
- `itemType`
- `title`
- `creator`
- `tag`
- `dateAdded`
- `dateModified`
- `date` (publication date)
- `collection`

Operators:
- `is`, `isNot`
- `contains`, `doesNotContain`
- `beginsWith`
- `isLessThan`, `isGreaterThan`
- `isBefore`, `isAfter` (for dates)

### Deleting Saved Searches

```
delete_saved_search(keys=["SEARCH123", "SEARCH456"])
```

---

## Groups

Groups are shared libraries for collaboration.

### Viewing Groups

```
list_groups()
```

**Note**: Group libraries are separate from your personal library. To access group items, you would need to configure the MCP server with the group's library ID.

---

## Organizational Strategies

### Project-Based Organization

Create a collection hierarchy per project:
```
Dissertation/
├── Chapter 1 - Theory/
├── Chapter 2 - Methods/
├── Chapter 3 - Findings/
└── To Process/
```

### Workflow Tags

Use tags for reading workflow:
- `to-read`: Unread items
- `reading`: Currently reading
- `done`: Finished reading
- `priority`: High priority
- `skim`: Only need to skim

### Topic + Method Tags

Combine topic and method tags:
- Topics: `housing`, `health`, `inequality`
- Methods: `qualitative`, `quantitative`, `mixed`
- Theory: `bourdieu`, `neo-institutionalism`

### Color-Coded Tags

Zotero supports colored tags (set in desktop app). Use for visual workflow:
- Red: Urgent
- Yellow: In progress
- Green: Complete
- Blue: Reference

---

## Workflow Example: Setting Up a Lit Review

1. **Create main collection**:
   ```
   create_collections(collections=[{"name": "Housing Instability Lit Review"}])
   ```

2. **Create subcollections**:
   ```
   create_collections(collections=[
     {"name": "Theory", "parentCollection": "MAIN123"},
     {"name": "Empirical", "parentCollection": "MAIN123"},
     {"name": "Methods", "parentCollection": "MAIN123"},
     {"name": "To Read", "parentCollection": "MAIN123"}
   ])
   ```

3. **Search for relevant items**:
   ```
   search_items(query="housing instability", item_type="journalArticle", limit=50)
   ```

4. **Add items to collections**:
   ```
   add_item_to_collection(collection_key="TOREAD123", item_key="ITEM456")
   ```

5. **Tag for priority**:
   ```
   update_item(item_key="ITEM456", fields={
     "tags": [{"tag": "to-read"}, {"tag": "priority"}]
   })
   ```

6. **Create saved search for tracking**:
   ```
   create_saved_search(
     name="Unread Housing Papers",
     conditions=[
       {"condition": "collection", "operator": "is", "value": "MAIN123"},
       {"condition": "tag", "operator": "is", "value": "to-read"}
     ]
   )
   ```

---

## Best Practices

1. **Collections for projects, tags for attributes**: Collections group items for a purpose; tags describe characteristics.

2. **Don't over-nest**: Deep collection hierarchies become hard to navigate. 2-3 levels is usually enough.

3. **Consistent tag naming**: Use lowercase, hyphens for multi-word tags (`lit-review`, not `Lit Review`).

4. **Archive old collections**: Instead of deleting, move completed project collections to an "Archive" parent.

5. **Regular cleanup**: Periodically review and delete unused tags.

---

## When You're Done

Report organizational changes:
- Collections created/modified
- Items organized
- Tags applied

Example:
> "Created 'Housing Instability Lit Review' collection with 4 subcollections. Added 15 items to 'To Read'. Tagged 5 items as 'priority'. Created saved search for unread papers."
