# Attachments

## Why This Guide Matters

Attachments connect bibliographic records to actual documents. This guide covers downloading, uploading, and linking files to Zotero items.

**API modes**:
- **Downloads**: Work with local API (fast)
- **Uploads/Links**: Require web API (needs `ZOTERO_API_KEY` in environment)

The server automatically uses local API for reads and web API for writes.

---

## Attachment Types

Zotero supports several attachment modes:

| Mode | Storage | Description |
|------|---------|-------------|
| `imported_file` | Zotero cloud | File uploaded and synced |
| `linked_file` | Local path | Reference to file on disk |
| `imported_url` | Zotero cloud | Web snapshot |
| `linked_url` | URL | Link to web page |

### When to Use Each

**Stored (`imported_file`)**:
- Primary PDFs you need everywhere
- Small files
- Collaborative libraries

**Linked (`linked_file`)**:
- Large files (videos, datasets)
- Files already in organized folders
- When storage quota is limited
- Faster access (no download)

---

## Downloading Attachments

### Download All Attachments for an Item

```
download_attachments(item_key="ABC123XY")
```

Files are saved to:
```
$ZOTERO_ATTACHMENTS_DIR/ABC123XY/filename.pdf
```

Default: `./zotero-attachments/`

### Overwrite Existing Files

```
download_attachments(item_key="ABC123XY", overwrite=true)
```

By default, existing files are skipped.

### Response Format

```json
{
  "item_key": "ABC123XY",
  "saved": [
    "/path/to/attachments/ABC123XY/Smith_2024.pdf",
    "/path/to/attachments/ABC123XY/Supplementary.docx"
  ]
}
```

Errors appear as `ERROR:key:message`.

### Check for Attachments First

Before downloading, verify attachments exist:
```
item = get_item(item_key="ABC123XY", include_children=true)
# Check item["children"] for attachment items
```

---

## Recommended Pattern: Two-Step Attachment

The most reliable way to attach files is a two-step process:

### Step 1: Create the Item

```
result = add_item(
  item_type="journalArticle",
  fields={"title": "My Paper", "date": "2024"}
)
item_key = result["created"]["successful"]["0"]["key"]
```

### Step 2: Attach as Linked File

```
attach_linked_file(
  item_key=item_key,
  file_path="/path/to/paper.pdf",
  title="Full Text PDF"
)
```

**Why this pattern?**
- `add_item` with `attachment_paths` can fail silently on uploads
- Linked files have no storage quota limits
- Linked files work immediately without upload delays
- You can verify the attachment was created

---

## Alternative: Upload to Zotero Storage

If you need files synced across devices, try uploading:

### Upload File (Stored Attachment)

```
attach_file(item_key="ABC123XY", file_path="/path/to/paper.pdf")
```

Optional custom title:
```
attach_file(
  item_key="ABC123XY",
  file_path="/path/to/paper.pdf",
  title="Full Text PDF"
)
```

### Automatic Fallback

If upload fails due to storage quota (413 error), `attach_file` automatically creates a **linked file** instead:

```json
{
  "attached": {
    "linked_fallback": {
      "successful": {"0": {"key": "ATT123", ...}}
    }
  }
}
```

The `linked_fallback` key indicates fallback was used.

### If Upload Fails

If `attach_file` fails entirely, fall back to linked:

```
# Upload failed? Use linked instead
attach_linked_file(item_key="ABC123XY", file_path="/path/to/paper.pdf")
```

---

## Linking Attachments

### Create Linked File Attachment

```
attach_linked_file(
  item_key="ABC123XY",
  file_path="/path/to/paper.pdf"
)
```

With custom title:
```
attach_linked_file(
  item_key="ABC123XY",
  file_path="/path/to/paper.pdf",
  title="Full Text (Linked)"
)
```

### Requirements

- File must exist at the specified path
- Path is stored as-is (use absolute paths for reliability)
- File is NOT copied or uploaded

### Linked File Considerations

**Advantages**:
- No storage quota usage
- Faster (no upload)
- Works with any file size

**Disadvantages**:
- Not synced across devices
- Breaks if file moves
- Only accessible from original machine

---

## Understanding Attachment Link Modes

Get available modes:
```
item_attachment_link_modes()
```

Returns:
```json
{
  "item_attachment_link_modes": [
    {"linkMode": "imported_file"},
    {"linkMode": "imported_url"},
    {"linkMode": "linked_file"},
    {"linkMode": "linked_url"}
  ]
}
```

---

## Attachment Workflows

### Workflow 1: Attach PDF to New Item

```python
# 1. Create item
result = add_item(
  item_type="journalArticle",
  fields={"title": "Housing Study", "date": "2024"}
)
item_key = result["created"]["successful"]["0"]["key"]

# 2. Attach PDF
attach_file(item_key=item_key, file_path="/downloads/housing.pdf")
```

Or in one step:
```
add_item(
  item_type="journalArticle",
  fields={"title": "Housing Study", "date": "2024"},
  attachment_paths=["/downloads/housing.pdf"]
)
```

### Workflow 2: Bulk Download Collection PDFs

```python
# 1. Get items in collection
items = collection_items(collection_key="COLL123")

# 2. Download attachments for each
for item in items["items"]:
    download_attachments(item_key=item["key"])
```

### Workflow 3: Link Existing PDF Library

For papers already organized in folders:
```python
# 1. Create item
result = add_item(
  item_type="journalArticle",
  fields={"title": "Smith 2024", "date": "2024"}
)
item_key = result["created"]["successful"]["0"]["key"]

# 2. Link existing PDF (no upload)
attach_linked_file(
  item_key=item_key,
  file_path="/papers/Smith_2024.pdf"
)
```

### Workflow 4: Handle Large Files

For files likely to exceed quota:
```
# Use linked file directly
attach_linked_file(
  item_key="ABC123XY",
  file_path="/data/large_dataset.zip"
)
```

---

## Managing Existing Attachments

### View Item's Attachments

```
item = get_item(item_key="ABC123XY", include_children=true)
attachments = [c for c in item["children"]
               if c["data"]["itemType"] == "attachment"]
```

### Delete Attachment

Attachments are items, so:
```
delete_item(item_key="ATTACHMENT_KEY")
```

### Update Attachment Title

```
update_item(
  item_key="ATTACHMENT_KEY",
  fields={"title": "New Attachment Title"}
)
```

---

## File Format Support

Zotero supports most file types. Common academic files:
- PDFs (`.pdf`)
- Word documents (`.docx`, `.doc`)
- Images (`.png`, `.jpg`)
- Data files (`.csv`, `.xlsx`)
- Code (`.R`, `.py`)

Content type is auto-detected based on file extension.

---

## Troubleshooting

### "FileNotFoundError"

- Check file path is correct
- Use absolute paths
- Verify file exists

### "413 Request Entity Too Large"

- Storage quota exceeded
- Use `attach_linked_file` instead
- Or `attach_file` will auto-fallback

### Empty Download

- Item has no attachments
- Attachments are linked (not stored)
- PDF is in cloud but not downloaded yet

### Linked File Not Opening

- File moved from original location
- Path not accessible
- Check path stored in Zotero

---

## Best Practices

1. **Prefer linked files for large files**: Datasets, videos, archives.

2. **Use stored for primary PDFs**: They sync across devices.

3. **Consistent file naming**: `AuthorYear_ShortTitle.pdf` makes files findable.

4. **Absolute paths for linked files**: Relative paths break when working directory changes.

5. **Check quota before bulk uploads**: Start small, verify success.

6. **Organize downloaded files**: Create project folders, not one flat directory.

---

## Storage Quota

Zotero provides limited free storage (300MB), with paid plans for more:
- 2GB: $20/year
- 6GB: $60/year
- Unlimited: $120/year

Linked files don't count against quota.

---

## When You're Done

Report attachment operations:
- Files downloaded and locations
- Files uploaded/linked
- Any errors or fallbacks

Example:
> "Downloaded 5 PDFs to `/attachments/COLL123/`. Attached 3 new PDFs to existing items. 1 file exceeded quota - created linked attachment instead. All items now have PDF access."
