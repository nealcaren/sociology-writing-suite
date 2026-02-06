# Setup & Configuration

## Why This Phase Matters

Proper configuration ensures reliable access to the Zotero library. This phase validates the connection before attempting any operations, catching configuration errors early.

---

## Step 1: Check Configuration

Run the health check to validate environment:

```
health_check()
```

Expected successful response:
```json
{"ok": true, "missing": [], "local": true}
```

If `ok` is `false`, the `missing` array lists required environment variables.

---

## Step 2: Verify Connection

After configuration looks good, test actual API access:

```
ping()
```

Expected response:
```json
{"ok": true, "server": "zotero"}
```

If this fails, check that:
- Zotero desktop app is running (for local API)
- Network connectivity (for web API)
- API key is valid

---

## Step 3: Test Search

Verify you can retrieve items:

```
search_items(query="test", limit=1)
```

This confirms:
- Authentication is working
- Library ID is correct
- You can read from the library

---

## Configuration Options

### Recommended: Hybrid Mode (Local + Web)

The server automatically uses:
- **Local API** for reads (fast, requires Zotero app)
- **Web API** for writes (requires `ZOTERO_API_KEY`)

**Requirements**:
- Zotero desktop app running
- "Allow other applications" enabled in Zotero preferences
- `ZOTERO_LOCAL=true` (default)
- `ZOTERO_LOCAL_KEY` or `ZOTERO_API_KEY` (for reads)
- `ZOTERO_API_KEY` (for writes - creating items, attaching files)

**How to enable local API in Zotero**:
1. Open Zotero
2. Go to **Edit > Preferences** (Windows/Linux) or **Zotero > Settings** (Mac)
3. Navigate to **Advanced > General**
4. Enable **"Allow other applications on this computer to communicate with Zotero"**

### Web API Key (Required for Writes)

To create items, attach files, or organize collections, you need a web API key:

1. Go to https://zotero.org/settings/keys
2. Click "Create new private key"
3. Name it (e.g., "Claude Code")
4. Grant appropriate permissions:
   - Library access: Read/Write
   - Notes access: Read/Write
5. Save the key as `ZOTERO_API_KEY` in your environment

**Finding your Library ID**:
1. Go to https://www.zotero.org/settings/keys
2. Your Library ID is shown at the top: "Your userID for use in API calls is XXXXXXX"

### Web-Only Mode (Optional)

If you don't have Zotero desktop running, set `ZOTERO_LOCAL=false` to use web API for everything. This is slower for reads but works without the desktop app.

---

## MCP Configuration

Add the server to your `.mcp.json` file.

### Option 1: Credentials in Environment Variables (Recommended)

If you store credentials in your shell profile (`.bashrc`, `.zshrc`, etc.):

```bash
# In your shell profile
export ZOTERO_LIBRARY_ID="your_user_id"
export ZOTERO_LIBRARY_TYPE="user"
export ZOTERO_LOCAL_KEY="your_local_key"
export ZOTERO_API_KEY="your_api_key"
```

Then use a minimal `.mcp.json` that inherits from environment:

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

### Option 2: Credentials in MCP Config

For explicit configuration or if env vars aren't set:

```json
{
  "mcpServers": {
    "zotero": {
      "type": "stdio",
      "command": "uv",
      "args": ["run", "--project", "/path/to/mcp-zotero", "mcp-zotero"],
      "env": {
        "ZOTERO_LOCAL": "true",
        "ZOTERO_LIBRARY_ID": "your_user_id",
        "ZOTERO_LIBRARY_TYPE": "user",
        "ZOTERO_LOCAL_KEY": "your_local_key"
      }
    }
  }
}
```

### After Configuration

Restart Claude Code to load the new MCP server.

---

## Troubleshooting

### "ZOTERO_LIBRARY_ID is required"

Set the environment variable:
```bash
export ZOTERO_LIBRARY_ID="your_user_id"
```

Or add to `.mcp.json`:
```json
"env": {
  "ZOTERO_LIBRARY_ID": "your_user_id"
}
```

### "Connection refused" with Local API

1. Ensure Zotero desktop is running
2. Check "Allow other applications" is enabled
3. Restart Zotero if needed

### "401 Unauthorized" with Web API

1. Verify API key is correct
2. Check key has appropriate permissions
3. Ensure key hasn't expired

### "Write operations require ZOTERO_LOCAL=false"

You're trying to write (create, update, delete, attach) in local mode:
1. Set `ZOTERO_LOCAL=false`
2. Provide valid `ZOTERO_API_KEY`

---

## Switching Between Modes

To switch from local (read-only) to web (read/write):

1. Update environment variables:
   ```bash
   export ZOTERO_LOCAL=false
   export ZOTERO_API_KEY="your_web_api_key"
   ```

2. Or update `.mcp.json`:
   ```json
   "env": {
     "ZOTERO_LOCAL": "false",
     "ZOTERO_API_KEY": "your_web_api_key"
   }
   ```

3. Restart the MCP server (reload Claude Code)

---

## When You're Done

Report configuration status:
- API mode (local/web)
- Read/write capability
- Any missing configuration

Example:
> "Zotero connection verified. Running in local (read-only) mode. Library ID: 12345. To enable write operations, set `ZOTERO_LOCAL=false` and provide `ZOTERO_API_KEY`."
