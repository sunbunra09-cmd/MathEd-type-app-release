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
  - Real-time CLI argument scanner terminating the process immediately if `--remote-debugging-port`, `--js-flags`, or debugger pipes are detected.
  - Automatic closure of Developer Tools if opened.
  - Suppression of developer keyboard shortcuts (`F12`, `Ctrl+Shift+I`, `Ctrl+Shift+J`).
* **Runtime Bytecode Self-Integrity Verification**:
  - Real-time verification of all core `.jsc` files (`license-manager.jsc`, `trial-guard.jsc`, `crypto-verifier.jsc`, `hwid.jsc`) aborting execution if any module is swapped or corrupted.
* **All-in-One Standalone Setup & Auto-Updates**:
  - Standalone installer (`MathEdType-Setup-v0.1.67.exe` & `MathEdType-Setup.exe`).
  - Auto-updater manifest (`latest.yml`).

### 📥 Downloads
| File | Description | Size |
| :--- | :--- | :--- |
| **`MathEdType-Setup-v0.1.67.exe`** | Versioned standalone installer | 80.68 MB |
| **`MathEdType-Setup.exe`** | Latest generic standalone installer | 80.68 MB |
| **`latest.yml`** | Auto-updater release manifest | 352 B |

### 🛠️ Verification & SHA256 Checksum
* `18D607613374231160A9CE02FADCA5D7E788A926AAEAB5C764E8033CAE6BD47C`



