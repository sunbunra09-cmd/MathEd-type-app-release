## MathEd Type v0.1.67 - Enterprise Hardening & 5-Layer Anti-Tamper Defense

This release delivers the ultimate security and anti-tamper architecture for **MathEd Type**, resolving all reverse engineering, clock tampering, and local privilege escalation vectors with cryptographic, OS-level, and framework-level protections:

### 🌟 Key Security & Architecture Enhancements
* **Patched Electron 35.7.5 Runtime (Mitigating CVE-2025-55305 / GHSA-vmqv-hx8q-j7mg)**:
  - Upgraded the underlying Electron framework to **Electron 35.7.5**, incorporating the official upstream security fix for CVE-2025-55305.
  - Native C++ ASAR integrity and Electron fuses (`EnableEmbeddedAsarIntegrityValidation: true`, `OnlyLoadAppFromAsar: true`, `RunAsNode: false`, `EnableNodeCliInspectArguments: false`, `EnableNodeOptionsEnvironmentVariable: false`) enforced directly on the native binary.
* **Protected Installation Directory (`%ProgramFiles%\MathEd Type`)**:
  - The installer now installs to `%ProgramFiles%\MathEd Type` with administrative execution privileges (`RequestExecutionLevel admin`).
  - Standard user accounts in Windows have **Read & Execute ONLY** (zero write access, zero delete access, zero append access) under Program Files, eliminating the filesystem write-access prerequisite for ASAR modification.
* **Comprehensive NTFS DACL / ACL Hardening**:
  - NSIS installer applies strict `icacls ... /deny ...:(D,WD,AD,WEA,WA)` denying Delete `(D)`, Write Data `(WD)`, Append Data `(AD)`, Write Extended Attributes `(WEA)`, and Write Attributes `(WA)` with verified execution return codes.
* **Cryptographically Bound Uptime & Clock Rollback Defense**:
  - `license-manager.js` now cryptographically binds `lastSeen`, `lastUptime`, and `keyHash` together into the HMAC signature (`signRecord`).
  - Tampering with `lastUptime` or `lastSeen` in local JSON files immediately breaks the HMAC signature and triggers anti-tamper revocation.
* **Awaited Authenticated HTTPS Network Time Synchronization**:
  - Startup checks now await HTTPS TLS network time queries (`ensureNetworkTime`) against Cloudflare, Google, and Microsoft before validating licenses.
  - Expired licenses are immediately and irrevocably revoked before UI rendering, immune to local PC clock manipulation.
* **Multi-Factor Dynamic HMAC Secret**:
  - Derived dynamically at runtime from Hardware Machine ID, Windows Registry `MachineGuid`, Windows `DigitalProductId`, and Windows user account identity (`USERDOMAIN\USERNAME`) via multi-round SHA-512 hashing.
* **Multi-Root Redundant Revocation Store**:
  - Revocations are persisted redundantly across `HKCU\Software\MathEdType\Revocations`, hidden CLSID registry anchors, and a hidden system cache index file.
* **Authenticode Code Signing & RFC 3161 Timestamping**:
  - `MathEd Type.exe` and installers are digitally signed with Windows Authenticode and timestamped via DigiCert RFC 3161 timestamp responders.
  - Public certificate `MathEdType-Publisher-Root.cer` and helper installer `Install-Publisher-Cert.ps1` are included for full trust chain verification.

### 📥 Downloads
| File | Description | Size |
| :--- | :--- | :--- |
| **`MathEdType-Setup-v0.1.67.exe`** | Versioned standalone installer | 91.01 MB |
| **`MathEdType-Setup.exe`** | Latest generic standalone installer | 91.01 MB |
| **`latest.yml`** | Auto-updater release manifest | 352 B |
| **`MathEdType-Publisher-Root.cer`** | Public code-signing root certificate | 870 B |
| **`Install-Publisher-Cert.ps1`** | Helper script to install root certificate | 410 B |

### 🛠️ Verification & SHA256 Checksums
* **`MathEdType-Setup-v0.1.67.exe`**: `C536F7E2854AB4AA95E02067A1DB54058D0AAF9816A4F9EC365F3A85D838FEA4`
* **`MathEdType-Setup.exe`**: `BCD590A9A458AADBA842E2A70F9989D75B3F1E8D11EBA6E99F1DF34855BA0782`
