## MathEd Type v0.1.68 - Enterprise Hardening & Zero-Failure Microsoft Word Integration

This release delivers the definitive, 100% reliable COM/OLE integration architecture for **Microsoft Word and PowerPoint**, resolving all single-instance mutex collisions, cross-bitness activation failures, and VSTO manifest conflicts alongside the complete 5-layer anti-tamper security defense:

### 🌟 Key Enhancements in v0.1.68

* **Dedicated Out-of-Process OLE Activation Host (`MathEdTypeOleHost.exe`)**:
  - Replaced the legacy monolithic COM server with an independent, lightweight x86 STA activation host (`MathEdTypeOleHost.exe`) compiled specifically for out-of-process OLE serving.
  - Completely eliminates the legacy `Local\MathRendererOleServer` single-instance mutex collision that previously caused subsequent equation editing attempts to time out with `CO_E_SERVER_EXEC_FAILURE` (`0x80080005`).
  - Supports unlimited concurrent and sequential equation activations across both 64-bit and 32-bit Microsoft Word and PowerPoint sessions with sub-10ms response times.

* **Dual-Architecture Registry Synchronization & Active Setup Self-Repair**:
  - Automatically registers `MathRenderer.Equation`, `MathRenderer.Equation.1`, and CLSID `{6C3B5E2A-9F41-4D8B-A7E2-3B1F0C9D5A71}` in both 64-bit (`HKLM\Software\Classes`) and 32-bit (`HKLM\Software\Classes\WOW6432Node`) hives.
  - Automatically cleans up legacy per-user HKCU overrides (`--repair-user-registration`) during installation.
  - Deploys Windows Active Setup (`Software\Microsoft\Active Setup\Installed Components`) ensuring any other user profile on the machine automatically has its COM registration repaired upon sign-in.

* **Elimination of Office VSTO Manifest Collisions**:
  - Removed ClickOnce VSTO `Manifest` keys from `Software\Microsoft\Office\Word\Addins\MathRenderer.WordAddin`, preventing Office VSTO Runtime from generating `InvalidDeploymentException` / XML parsing errors.
  - Integrates the AnyCPU COM add-in shim (`MathRendererWord.Shim.dll`) cleanly via standard Office COM add-in protocols.

* **Enhanced Non-Intrusive & Silent Deployment**:
  - Installer wraps pre-install document prompts with `${IfNot} ${Silent}`, ensuring automated deployments, silent installations (`/S`), and background updates complete seamlessly without terminating open documents or blocking.

* **Unified Electron 35.7.5 Security Architecture**:
  - Native C++ ASAR integrity and Electron fuses (`EnableEmbeddedAsarIntegrityValidation: true`, `OnlyLoadAppFromAsar: true`, `RunAsNode: false`, `EnableNodeCliInspectArguments: false`, `EnableNodeOptionsEnvironmentVariable: false`) enforced directly on the native binary.
  - Cryptographic SHA-256 integrity table embedded in bytecode verifies all 32 compiled `.jsc` modules and V8 snapshot blobs at startup.
  - 5-layer redundant hardware-bound revocation store with instant HMAC-SHA256 signature mismatch revocation.

* **Authenticode Code Signing & RFC 3161 Timestamping**:
  - `MathEd Type.exe` and standalone installers are digitally signed with Windows Authenticode and timestamped via DigiCert RFC 3161 timestamp responders.
  - Public certificate `MathEdType-Publisher-Root.cer` and helper installer `Install-Publisher-Cert.ps1` are included for enterprise root trust distribution.

---

### 📥 Downloads
| File | Description | Size | SHA256 Checksum |
| :--- | :--- | :--- | :--- |
| **`MathEdType-Setup-v0.1.68.exe`** | Versioned standalone installer | 91,448,281 B (87.21 MB) | `A9B74D17429B7681AE295EECB48826AB25FDF6C4DE708953B8CCF10BA8A49D4D` |
| **`MathEdType-Setup.exe`** | Latest generic standalone installer | 91,448,281 B (87.21 MB) | `2A22B2E635A4586588D68938C8C2EAB70053CFED4F117CC616FE1A1E40723C0A` |
| **`latest.yml`** | Auto-updater release manifest | 352 B | — |
| **`MathEdType-Publisher-Root.cer`** | Public code-signing root certificate | 870 B | — |
| **`Install-Publisher-Cert.ps1`** | Helper script to install root certificate | 410 B | — |
