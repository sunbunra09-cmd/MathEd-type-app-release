## MathEd Type v0.1.66 - Enterprise-Grade License Anti-Bypass Architecture

This release introduces an enterprise-grade cryptographic anti-bypass security shield for **MathEd Type**, securing the software against license tampering, key substitution, unauthorized operations, and reverse engineering.

### 🌟 What's New & Included
* **Enterprise License Anti-Bypass Shield**:
  - **Embedded Ed25519 Public Key with SHA256 Integrity Check**: Removed loose `keys.json` file. The genuine cryptographic public key is hardcoded directly into the binary bytecode alongside runtime SHA256 hash verification to prevent forged public key injection.
  - **Windows Registry Dual Persistence & Self-Healing**: Genuine license keys are synchronized between `%APPDATA%\license.json` and `HKCU\Software\MathEdType\LicenseKey`. If the license file is deleted or modified, it is automatically verified and restored from the Registry.
  - **Native Backend IPC Operation Gatekeeper**: Enforces strict license/trial verification at the Electron main process IPC level for `insert-into-word`, `update-in-word`, `copy-equation`, and `copy-text`. UI bypass attempts (e.g. devtools/CSS tweaks) are completely blocked because the backend rejects unauthorized operations.
  - **V8 Bytecode (.jsc) Binary Compilation**: All licensing modules (`license-manager`, `crypto-verifier`, `trial-guard`, `hwid`) are compiled to binary V8 bytecode inside `app.asar`, eliminating plaintext source code.
* **Dual-Layer Anti-Tamper Trial Security**:
  - Hardware-bound HMAC-SHA256 signature for 15-day trials.
  - Anti-clock rollback detection preventing system time adjustments.
* **Modern English-Only License Management UI**:
  - Direct access anytime via `Help` -> `License Information...`.
  - 100% Pure English interface with modern typography and refined card geometry.
  - Expiration countdown, Monospace Hardware ID with 1-click copy, and self-service license deactivation.
* **All-in-One Standalone Setup & In-App Auto-Updates**:
  - Single standalone setup installer (~80 MB) with zero external runtime requirements.
  - Auto-update support through GitHub release manifests (`latest.yml`).

### 📥 Downloads
| File | Description | Size |
| :--- | :--- | :--- |
| **`MathEdType-Setup-v0.1.66.exe`** | Versioned standalone installer | 80.66 MB |
| **`MathEdType-Setup.exe`** | Latest generic standalone installer | 80.66 MB |
| **`latest.yml`** | Auto-updater release manifest | 352 B |

### 🛠️ Verification & SHA256 Checksum
* `BD7221A15FCF454D96004411FFD682849A0D3E9C78387519AFDA6DADA817CED0`


