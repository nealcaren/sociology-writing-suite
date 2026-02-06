# Error Patterns & Troubleshooting

Common errors when using MCP Zotero and how to resolve them.

---

## Configuration Errors

### "ZOTERO_LIBRARY_ID is required"

**Cause**: Missing required environment variable.

**Fix**:
1. Set the environment variable:
   ```bash
   export ZOTERO_LIBRARY_ID="your_user_id"
   ```
2. Or add to `.mcp.json`:
   ```json
   "env": {
     "ZOTERO_LIBRARY_ID": "your_user_id"
   }
   ```

**Finding your Library ID**:
- Go to https://www.zotero.org/settings/keys
- Your userID is shown at the top

---

### "ZOTERO_LOCAL_KEY (or ZOTERO_API_KEY) missing"

**Cause**: No API key configured for local mode.

**Fix**:
```bash
export ZOTERO_LOCAL_KEY="your_local_key"
# or
export ZOTERO_API_KEY="your_api_key"
```

---

### "ZOTERO_API_KEY is required when ZOTERO_LOCAL=false"

**Cause**: Web API mode selected but no API key provided.

**Fix**:
1. Get API key from https://zotero.org/settings/keys
2. Set environment variable:
   ```bash
   export ZOTERO_API_KEY="your_api_key"
   ```

---

## Connection Errors

### "Connection refused" (Local API)

**Cause**: Zotero desktop app not running or API not enabled.

**Fix**:
1. Start Zotero desktop application
2. Enable local API:
   - Go to **Edit > Preferences** (Windows/Linux) or **Zotero > Settings** (Mac)
   - Navigate to **Advanced > General**
   - Enable **"Allow other applications on this computer to communicate with Zotero"**
3. Restart Zotero

---

### "401 Unauthorized"

**Cause**: Invalid or expired API key.

**Fix**:
1. Verify API key at https://zotero.org/settings/keys
2. Check key permissions (needs library access)
3. Generate new key if needed
4. Update environment variable

---

### "403 Forbidden"

**Cause**: API key lacks required permissions.

**Fix**:
1. Go to https://zotero.org/settings/keys
2. Edit the key
3. Ensure "Allow library access" is checked
4. For write operations, ensure "Allow write access" is checked

---

### "404 Not Found"

**Cause**: Item, collection, or resource doesn't exist.

**Fix**:
1. Verify the key is correct
2. Check if item was deleted
3. Use `search_items` to find the correct key
4. Ensure you're accessing the right library (user vs group)

---

## Write Operation Errors

### "Write operations require ZOTERO_LOCAL=false (Web API only)"

**Cause**: Attempting to write in local mode.

**Fix**:
1. Set `ZOTERO_LOCAL=false`
2. Provide `ZOTERO_API_KEY`
3. Restart MCP server

Example:
```json
"env": {
  "ZOTERO_LOCAL": "false",
  "ZOTERO_API_KEY": "your_api_key"
}
```

---

### "413 Request Entity Too Large"

**Cause**: File upload exceeds Zotero storage quota.

**Fix** (automatic): `attach_file` automatically falls back to linked file.

**Fix** (manual): Use `attach_linked_file` instead.

**Prevention**:
- Check quota at https://www.zotero.org/settings/storage
- Upgrade storage plan if needed
- Use linked files for large files

---

### "409 Conflict"

**Cause**: Item was modified by another client since retrieval.

**Fix**:
1. Retrieve fresh item data with `get_item`
2. Retry the update operation
3. If persists, check for sync conflicts in Zotero desktop

---

## Search Errors

### Empty Results When Items Exist

**Possible causes and fixes**:

1. **Wrong qmode**:
   - Try `qmode="everything"` for full-text search
   - `titleCreatorYear` only searches those fields

2. **Tag not matching**:
   - Check exact tag spelling (case-sensitive)
   - Use `list_tags()` to see available tags

3. **Item type filter**:
   - Verify item type spelling
   - Use `item_types()` to see valid types

4. **Library ID wrong**:
   - Verify you're searching the correct library

---

### "Invalid item type"

**Cause**: Using an item type that doesn't exist.

**Fix**:
1. Call `item_types()` to see valid types
2. Common types: `journalArticle`, `book`, `bookSection`, `conferencePaper`, `thesis`

---

## Item Creation Errors

### "Invalid field"

**Cause**: Using a field that doesn't exist for the item type.

**Fix**:
1. Call `item_type_fields(item_type="yourType")` to see valid fields
2. Check field name spelling

---

### "Invalid creator type"

**Cause**: Using a creator type not valid for the item type.

**Fix**:
1. Call `item_creator_types(item_type="yourType")` to see valid types
2. Common types: `author`, `editor`, `contributor`

---

## Attachment Errors

### "FileNotFoundError"

**Cause**: File doesn't exist at specified path.

**Fix**:
1. Verify file exists
2. Use absolute path
3. Check for typos in path
4. Ensure file isn't locked by another application

---

### "pyzotero attachment_simple not available"

**Cause**: Older pyzotero version without upload support.

**Fix**:
1. Update pyzotero: `pip install --upgrade pyzotero`
2. Or use `attach_linked_file` instead

---

### Downloaded Files Missing Content

**Cause**: Attachment is linked (not stored) in Zotero.

**Fix**:
1. Linked files can't be downloaded via API
2. Access the file at its local path
3. Or upload the file first: `attach_file`

---

## Collection Errors

### "Collection not found"

**Cause**: Collection key is incorrect or collection was deleted.

**Fix**:
1. Use `list_collections()` to find correct key
2. Check if collection was deleted

---

### Items Gone After delete_collection

**Clarification**: `delete_collection` only removes the collection folder. Items remain in the library.

If items seem missing:
1. They're still in "My Library"
2. Search for them with `search_items`
3. They may just not be in any collection

---

## Rate Limiting

### "429 Too Many Requests"

**Cause**: Exceeded Zotero API rate limits.

**Fix**:
1. Wait before retrying (usually 1 minute)
2. Reduce request frequency
3. Batch operations where possible

---

## Debugging Steps

### General Debugging

1. **Check health**: `health_check()`
2. **Verify connection**: `ping()`
3. **Test basic search**: `search_items(query="test", limit=1)`

### For Write Errors

1. Verify `ZOTERO_LOCAL=false`
2. Verify `ZOTERO_API_KEY` is set and valid
3. Check API key permissions
4. Test with simple operation first

### For Search Issues

1. Try broader query
2. Try `qmode="everything"`
3. Remove filters (tags, item_type)
4. Check if items exist in Zotero desktop

### For Attachment Issues

1. Verify file exists and is readable
2. Check file size vs storage quota
3. Try linked file instead of upload
4. Check Zotero desktop for attachment status

---

## Getting Help

If issues persist:

1. **Check Zotero forums**: https://forums.zotero.org/
2. **pyzotero documentation**: https://pyzotero.readthedocs.io/
3. **Zotero API documentation**: https://www.zotero.org/support/dev/web_api/v3/start
4. **MCP Zotero README**: See `/mcp-zotero/README.md`
