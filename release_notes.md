## MathEd Type v0.1.67 - Enterprise Hardening & 5-Layer Anti-Tamper Defense

This release incorporates comprehensive security enhancements, addressing all reverse engineering and cracking vectors with cryptographic and OS-level protections:

### 🌟 Key Security & Architecture Enhancements
* **Authenticated HTTPS Network Time Verification**:
  - Secure TLS Date queries against trusted multi-source providers (Cloudflare, Google, Microsoft) with automatic failover.
  - Revokes trial keys immediately if network time confirms the expiration date has passed, completely immune to local PC clock manipulation.
* **Kernel Monotonic Clock Tracking (`GetTickCount64` / `os.uptime`)**:
  - Continuous monotonic hardware-clock tracking makes it mathematically impossible to roll back the system clock during runtime to prolong expired sessions.
* **Hardware-Bound Dynamic HMAC Secret**:
  - Monotonic timestamp anchors are cryptographically signed using hardware entropy derived from Windows `MachineGuid` and salted key derivation rather than static strings.
* **NTFS DACL / ACL Binary Hardening (Mitigating CVE-2025-55305 / GHSA-vmqv-hx8q-j7mg)**:
  - Automated NSIS post-install security lock (`icacls ... /deny ...:(WD,AD,WEA,WA)`) applied directly to `app.asar`, `MathEd Type.exe`, and V8 snapshots (`v8_context_snapshot.bin`, `snapshot_blob.bin`).
  - Blocks local user processes and unauthorized scripts from writing or modifying runtime binaries.
* **Native Windows ASAR Integrity Validation Fuse (`EnableEmbeddedAsarIntegrityValidation`)**:
  - Embedded Windows PE `INTEGRITY / ELECTRONASAR` resource block containing cryptographic SHA-256 header hash of `resources\app.asar`.
  - Electron fuses `EnableEmbeddedAsarIntegrityValidation: true` and `OnlyLoadAppFromAsar: true` enforced at native C++ level.
  - If `app.asar` is modified or repacked by even 1 byte, Electron aborts execution immediately.
* **Complete Main Process V8 Bytecode Compilation (`main-core.jsc`)**:
  - 100% of the core main process logic (window lifecycle, IPC handlers, license manager, security gatekeepers) is compiled into native V8 bytecode.
  - `main.cjs` is reduced to a minimal bootstrapper; zero plaintext application JavaScript exists in the packaged distribution.
* **100% Cryptographic Ed25519 Licensing Architecture**:
  - Complete elimination of local automatic trials. Unactivated installations require an Ed25519 digital signature key.
  - Trial keys strictly require hardware Machine ID binding (`m !== '*'`) and positive expiration (`exp > iss > 0`).
  - Deleting local files or registry keys simply resets the app to an unactivated state; no local trial engine exists to reset.
* **Authenticode Code Signing & RFC 3161 Timestamping**:
  - `MathEd Type.exe` and installers are digitally signed and timestamped using DigiCert RFC 3161 timestamp authorities.

### 📥 Downloads
| File | Description | Size |
| :--- | :--- | :--- |
| **`MathEdType-Setup-v0.1.67.exe`** | Versioned standalone installer | 80.83 MB |
| **`MathEdType-Setup.exe`** | Latest generic standalone installer | 80.83 MB |
| **`latest.yml`** | Auto-updater release manifest | 352 B |

### 🛠️ Verification & SHA256 Checksums
* **`MathEdType-Setup-v0.1.67.exe`**: `B9A8FF34D1C3CD955B3AFA454DFFDDC423BC9ADACCBACDE57125BC1154665B97`
* **`MathEdType-Setup.exe`**: `4CEE911C6E199A2212C413BD9D169805413DA5296BDB782869FDCDF5430DF776`
