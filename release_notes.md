## MathEd Type v0.1.67 - 4-Layer Anti-Crack & Enterprise Hardening Defense

This release delivers the strongest security hardening architecture for **MathEd Type**, defending the application against all four major reverse engineering and cracking vectors: binary patching, memory debugging, code injection, and asar tampering.

### 🌟 What's New & Included
* **Complete Main Process V8 Bytecode Compilation (`main-core.jsc`)**:
  - The entire core main process logic (window lifecycle, IPC handlers, license manager, security gatekeepers) has been compiled into native V8 bytecode (`main-core.jsc`).
  - `main.cjs` has been reduced to a simple 13-line bootstrapper.
  - Inside `app.asar`, there is **zero plaintext application JavaScript**. Unpacking the archive yields only compiled binary bytecode that cannot be decompiled.
* **Electron Fuses Native Binary Hardening**:
  - Permanent binary-level security flags flipped on `MathEd Type.exe`:
    - `RunAsNode: false` - Prevents crackers from launching the executable as a headless Node.js runner to extract code.
    - `EnableNodeCliInspectArguments: false` - Permanently disables `--inspect` and `--inspect-brk` in the native C++ binary.
    - `EnableNodeOptionsEnvironmentVariable: false` - Disables `NODE_OPTIONS` environment variable script injection.
    - `OnlyLoadAppFromAsar: true` - Forces the runtime to only accept trusted packaged `app.asar`.
* **Anti-Debugging & DevTools Lockdown**:
* **100% Cryptographic Ed25519 Licensing Architecture**:
  - **Eliminated Client-Side Auto-Trial**: Purged `trial-guard.js`, client-side HMAC secrets, local clock anchors, and trial storage files.
  - **Hardware-Bound On-Demand Trial Keys**: Trial licenses are issued strictly via the developer's Ed25519 offline private key, mathematically bound to the customer's hardware Machine ID (`m: HWID`, `t: 'trial'`, `exp: timestamp`).
  - **Zero Reset Vector**: Deleting local files or registry keys simply returns the app to an unactivated state; no local trial engine exists to reset.
  - **Strict Fatal Fuse Enforcement**: Automated build fails immediately if Electron security fuses cannot be permanently applied.
  - **Live Cryptographic Integrity Table**: Active SHA-256 integrity verification across all core bytecode modules.

### 📥 Downloads
| File | Description | Size |
| :--- | :--- | :--- |
| **`MathEdType-Setup-v0.1.67.exe`** | Versioned standalone installer | 80.7 MB |
| **`MathEdType-Setup.exe`** | Latest generic standalone installer | 80.7 MB |
| **`latest.yml`** | Auto-updater release manifest | 352 B |

### 🛠️ Verification & SHA256 Checksum
* `265D6CD19405122FAA5A0AE734CAF146144E40D0A104EF62D9F85ADAA8F9DDD5`




