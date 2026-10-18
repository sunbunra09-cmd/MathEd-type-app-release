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
* **Audited Security Remediations (Enterprise-Grade Posture)**:
  - **Rotated Ed25519 Cryptographic Keypair**: Private key strictly isolated from source repositories and stored offline only.
  - **4-Anchor Anti-Reset Trial Guard**: Hardware-bound trial token anchored across primary file, primary registry, stealth LocalAppData, and hidden COM CLSID registry key. Any attempt to reset the trial by wiping primary storage is trapped and locked.
  - **Trial Alignment**: Full 30-day hardware-bound trial.
  - **Strict Fatal Fuse Enforcement**: Automated build fails immediately if Electron security fuses cannot be permanently applied.
  - **Clean Bytecode Architecture**: Legacy stubs and dummy mockGuard eliminated; live cryptographic verification strictly enforced.

### 📥 Downloads
| File | Description | Size |
| :--- | :--- | :--- |
| **`MathEdType-Setup-v0.1.67.exe`** | Versioned standalone installer | 80.69 MB |
| **`MathEdType-Setup.exe`** | Latest generic standalone installer | 80.69 MB |
| **`latest.yml`** | Auto-updater release manifest | 352 B |

### 🛠️ Verification & SHA256 Checksum
* `BBDFAAB7F0FD3D3E64AB4FEA9A277CF72AD9C6472707FB9FF41C3AE5D41C2730`




