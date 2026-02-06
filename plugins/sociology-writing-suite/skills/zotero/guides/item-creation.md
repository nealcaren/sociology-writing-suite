# Item Creation & Modification

## Why This Guide Matters

Creating and modifying items is essential for building a research library. This guide covers adding new references, updating existing items, and managing item metadata.

**API mode**: Write operations require `ZOTERO_API_KEY` in your environment. The server automatically uses web API for writes while keeping local API for fast reads.

---

## Creating Items

### Basic Item Creation

```
add_item(
  item_type="journalArticle",
  fields={
    "title": "Housing Instability and Health Outcomes",
    "creators": [
      {"creatorType": "author", "firstName": "Jane", "lastName": "Smith"},
      {"creatorType": "author", "firstName": "John", "lastName": "Doe"}
    ],
    "publicationTitle": "Social Forces",
    "date": "2024",
    "volume": "102",
    "issue": "3",
    "pages": "1234-1267",
    "DOI": "10.1093/sf/soab123"
  }
)
```

### Understanding Item Types

Common item types and their key fields:

**journalArticle**:
- `title`, `creators`, `publicationTitle`, `date`
- `volume`, `issue`, `pages`, `DOI`, `ISSN`
- `abstractNote`, `url`

**book**:
- `title`, `creators`, `date`
- `publisher`, `place`, `ISBN`
- `numPages`, `edition`, `series`

**bookSection** (chapter):
- `title`, `creators`, `bookTitle`, `date`
- `publisher`, `place`, `pages`
- `ISBN`, `editor`

**conferencePaper**:
- `title`, `creators`, `conferenceName`, `date`
- `place`, `publisher`, `pages`
- `DOI`, `proceedingsTitle`

**thesis**:
- `title`, `creators`, `date`
- `university`, `thesisType` (PhD, Masters)
- `numPages`, `place`

**report**:
- `title`, `creators`, `date`
- `institution`, `reportNumber`, `reportType`
- `place`, `pages`

### Get Available Fields for an Item Type

```
item_type_fields(item_type="journalArticle")
```

Returns all valid fields for that item type.

### Get Available Item Types

```
item_types()
```

---

## Creator Types

Creators can have different roles depending on item type.

### Get Creator Types for Item Type

```
item_creator_types(item_type="book")
```

Common creator types:
- `author`
- `editor`
- `contributor`
- `translator`
- `seriesEditor`
- `reviewedAuthor`

### Creator Format

**Individual author**:
```json
{"creatorType": "author", "firstName": "Jane", "lastName": "Smith"}
```

**Single-field name** (for organizations):
```json
{"creatorType": "author", "name": "World Health Organization"}
```

**Multiple creators**:
```json
[
  {"creatorType": "author", "firstName": "Jane", "lastName": "Smith"},
  {"creatorType": "author", "firstName": "John", "lastName": "Doe"},
  {"creatorType": "editor", "firstName": "Sarah", "lastName": "Johnson"}
]
```

---

## Creating Items with Attachments

### Recommended: Two-Step Pattern

The most reliable approach is to create the item first, then attach files separately:

```
# Step 1: Create item
result = add_item(
  item_type="journalArticle",
  fields={
    "title": "Housing Instability",
    "creators": [{"creatorType": "author", "firstName": "Jane", "lastName": "Smith"}],
    "date": "2024"
  }
)
item_key = result["created"]["successful"]["0"]["key"]

# Step 2: Attach file as linked (reliable, no quota limits)
attach_linked_file(item_key=item_key, file_path="/path/to/paper.pdf")
```

### Alternative: Single-Step with attachment_paths

You can include attachments in the `add_item` call:

```
add_item(
  item_type="journalArticle",
  fields={
    "title": "Housing Instability",
    "creators": [{"creatorType": "author", "firstName": "Jane", "lastName": "Smith"}],
    "date": "2024"
  },
  attachment_paths=["/path/to/paper.pdf"]
)
```

**Warning**: This attempts to upload files to Zotero storage, which can fail silently due to:
- Storage quota exceeded
- File size limits
- Upload errors

The item will be created, but attachments may not appear. Always verify with `get_item(include_children=true)` or use the two-step pattern.

See [Attachments Guide](attachments.md) for more details.

---

## Updating Items

### Modify Specific Fields

```
update_item(
  item_key="ABC123XY",
  fields={
    "title": "Updated Title",
    "date": "2024-06"
  }
)
```

Only specified fields are updated; others remain unchanged.

### Add/Update Tags

Tags must be provided as a complete list:
```
update_item(
  item_key="ABC123XY",
  fields={
    "tags": [
      {"tag": "sociology"},
      {"tag": "qualitative"},
      {"tag": "housing"}
    ]
  }
)
```

### Update Creators

```
update_item(
  item_key="ABC123XY",
  fields={
    "creators": [
      {"creatorType": "author", "firstName": "Jane", "lastName": "Smith-Johnson"}
    ]
  }
)
```

### Add Abstract

```
update_item(
  item_key="ABC123XY",
  fields={
    "abstractNote": "This study examines the relationship between housing instability and health outcomes..."
  }
)
```

### Add URL

```
update_item(
  item_key="ABC123XY",
  fields={
    "url": "https://doi.org/10.1093/sf/soab123"
  }
)
```

---

## Deleting Items

```
delete_item(item_key="ABC123XY")
```

**Warning**: This permanently deletes the item and all its attachments.

---

## Working with Item Metadata

### Get All Available Fields

```
item_fields()
```

### Get Fields for Specific Type

```
item_type_fields(item_type="book")
```

### Get Creator Field Options

```
creator_fields()
```

---

## Common Workflows

### Import from Citation

Given a citation like "Smith, J. (2024). Housing Instability. Social Forces, 102(3), 1234-1267.":

```
add_item(
  item_type="journalArticle",
  fields={
    "title": "Housing Instability",
    "creators": [{"creatorType": "author", "firstName": "J.", "lastName": "Smith"}],
    "publicationTitle": "Social Forces",
    "date": "2024",
    "volume": "102",
    "issue": "3",
    "pages": "1234-1267"
  }
)
```

### Add DOI-Based Item

If you have a DOI, add it and Zotero can potentially retrieve other metadata:

```
add_item(
  item_type="journalArticle",
  fields={
    "title": "TBD",
    "DOI": "10.1093/sf/soab123"
  }
)
```

### Create Note Item

Notes are child items attached to a parent:

```
add_item(
  item_type="note",
  fields={
    "note": "<p>Key findings from this paper...</p>",
    "parentItem": "PARENT123"
  }
)
```

### Create Standalone Note

```
add_item(
  item_type="note",
  fields={
    "note": "<p>General research notes...</p>"
  }
)
```

---

## Validation Before Creating

### Check Item Type Exists

```
types = item_types()
# Verify your item_type is in the list
```

### Check Required Fields

Each item type has required and optional fields. At minimum:
- `title` (most types)
- `itemType` (handled by the tool)

### Validate Creator Types

```
creator_types = item_creator_types(item_type="journalArticle")
# Ensure your creatorType is valid for this item type
```

---

## Error Handling

### Common Errors

**"Write operations require ZOTERO_LOCAL=false"**:
- You're in local mode
- Switch to web API mode

**Invalid item type**:
- Check `item_types()` for valid options

**Invalid field**:
- Check `item_type_fields(item_type)` for valid fields

**Invalid creator type**:
- Check `item_creator_types(item_type)` for valid options

---

## Best Practices

1. **Use DOIs when available**: They enable reliable lookup and linking.

2. **Complete metadata**: Fill in as many fields as practical for better searchability.

3. **Consistent creator names**: Use full first names or initials consistently.

4. **Add abstracts**: Enables full-text search within Zotero.

5. **Tag on creation**: Add relevant tags when creating items.

6. **Verify before bulk operations**: Test with one item before creating many.

---

## When You're Done

Report items created/modified:
- Item keys created
- Attachments status
- Any errors encountered

Example:
> "Created 3 journal articles. Item keys: ABC123, DEF456, GHI789. PDF attached to ABC123. DEF456 attachment failed (quota exceeded, use linked file). GHI789 created without attachment."
