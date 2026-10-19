## MathEd Type v0.1.67 - Enterprise Hardening & Complete Tamper-Resistant Architecture

This release delivers the ultimate security and anti-tamper architecture for **MathEd Type**, resolving all reverse engineering, clock tampering, privilege escalation, and offline licensing bypass vectors with cryptographic, OS-level, and framework-level protections:

### 🌟 Key Security & Architecture Enhancements

* **Unified Electron Runtime with Full Native Bytecode Compatibility**:
  - The entire core codebase (including all 32 compiled `.jsc` bytecode modules, V8 snapshots, and preload scripts) is fully synchronized and compiled natively against the Electron runtime.
  - Native C++ ASAR integrity and Electron fuses (`EnableEmbeddedAsarIntegrityValidation: true`, `OnlyLoadAppFromAsar: true`, `RunAsNode: false`, `EnableNodeCliInspectArguments: false`, `EnableNodeOptionsEnvironmentVariable: false`) enforced directly on the native binary with zero cached data rejections.

* **Strict Non-Bypassable Program Files Installation & ACL Failure Checks**:
  - The installer strictly installs to `$PROGRAMFILES64\MathEd Type` with administrative execution privileges (`RequestExecutionLevel admin`). The directory selection page (`MUI_PAGE_DIRECTORY`) has been intentionally removed so users cannot redirect the installation to user-writable folders.
  - NSIS installer runs strict `icacls ... /deny ...:(D,WD,AD,WEA,WA)` with explicit exit code checks (`${If} $0 != 0`) ensuring standard users cannot modify, write, or delete app files.

* **Comprehensive Full-Archive Bytecode Integrity Table (All 32 `.jsc` Modules)**:
  - The static integrity table in `main-core.js` and build packaging now binds and cryptographically verifies **all 32 compiled `.jsc` bytecode modules** (including nested submodules) plus `v8_context_snapshot.bin` and `snapshot_blob.bin`.
  - Startup integrity check aborts application launch immediately if any bytecode module or snapshot hash does not match.

* **Immediate Tamper Revocation on Signature / Clock Mismatch**:
  - `license-manager.js` signs `lastSeen`, `lastUptime`, and `keyHash` via dynamic multi-factor HMAC-SHA256 (`signRecord`).
  - If a user rolls back their clock or modifies `lastSeen`/`lastUptime`, `verifyRecord` fails, and the key is **immediately and permanently revoked** (`revokeKey(keyHash)`) rather than merely discarded.

* **Awaited Trusted Time & Gatekeeper Lockdown**:
  - All IPC licensing handlers (`license-status`, `license-activate`, `license-clear`, `license-trial`) and core operation gatekeepers (`insert-into-word`, `update-in-word`, `copy-text`, `copy-equation`, `save-before-close`) strictly **await** trusted network time synchronization before evaluating entitlement.
  - Synchronous unawaited bypasses are eliminated across the entire IPC bridge.

* **5-Layer Redundant Revocation Store with Machine-Level Persistence**:
  - Revocations are persisted across 5 separate stores, including machine-level stores that standard users cannot delete:
    1. `HKLM\Software\MathEdType\Revocations` (Machine-level Registry)
    2. `%ProgramData%\MathEdType\revocations.idx` (Machine-level File System)
    3. `HKCU\Software\MathEdType\Revocations` (User Registry)
    4. `HKCU\Software\Classes\CLSID\{D87A64B2-5B4E-436C-81F9-32F7F2E2C8A1}` (Hidden CLSID Anchor)
    5. `%LOCALAPPDATA%\Microsoft\Windows\INetCache\revocations.idx` (Hidden Local AppData Store)

* **Authenticode Code Signing & RFC 3161 Timestamping**:
  - `MathEd Type.exe` and installers are digitally signed with Windows Authenticode and timestamped via DigiCert RFC 3161 timestamp responders.
  - Public certificate `MathEdType-Publisher-Root.cer` and helper installer `Install-Publisher-Cert.ps1` are included for enterprise root trust distribution.

---

### 📥 Downloads
| File | Description | Size | SHA256 Checksum |
| :--- | :--- | :--- | :--- |
| **`MathEdType-Setup-v0.1.67.exe`** | Versioned standalone installer | 91,476,953 B (87.24 MB) | `9E08F39DABFCF487DAB1BABD960FFD6EC2A6541FD2222471AF809ABD97EA66A9` |
| **`MathEdType-Setup.exe`** | Latest generic standalone installer | 91,476,953 B (87.24 MB) | `03F5BD60A66D441279ED98CD6808B03DB1867B24EA2E7228DDB2BE4A5DBA171A` |
| **`latest.yml`** | Auto-updater release manifest | 352 B | — |
| **`MathEdType-Publisher-Root.cer`** | Public code-signing root certificate | 870 B | — |
| **`Install-Publisher-Cert.ps1`** | Helper script to install root certificate | 410 B | — |
