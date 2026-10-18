## MathEd Type v0.1.65 - Anti-Tamper Trial Security & Modern License UI

This release introduces an enterprise-grade anti-tamper security architecture for the 15-day trial license, dual-layer Windows Registry persistence, anti-clock rollback detection, alongside our modern English-only license management interface.

### 🌟 What's New & Included
* **Anti-Tamper Cryptographic Trial Security**:
  - **HMAC-SHA256 Machine Binding**: Trial tokens are cryptographically signed using an application secret salt and the unique hardware machine ID. Any manual modification to timestamps or payloads invalidates the token immediately.
  - **Dual-Layer Windows Registry Persistence**: Active trial state is redundantly synchronized to `HKCU\Software\MathEdType\TrialToken`. If a user deletes or alters `%APPDATA%\MathEd Type\trial.json`, the application automatically reconstructs the genuine trial timeline from the Windows Registry and prevents resetting.
  - **Anti-Clock Rollback Defense**: Real-time monotonic time tracking prevents users from manipulating their Windows system clock backwards to freeze or extend the 15-day trial period.
* **Modern English-Only License Management UI**:
  - Direct access anytime via `Help` -> `License Information...`.
  - 100% Pure English interface with modern typography and refined card geometry.
  - Modern Hero status banner featuring active status dot indicator (`● Active License`).
  - Clear visual expiration date display (e.g. `Oct 18, 2027`) and days remaining countdown (`365d left`).
  - Monospace Machine Hardware ID with 1-click `Copy ID` button and animated feedback (`✓ Copied!`).
  - Inline key renewal / activation form with smooth transition.
* **Self-Service License Deactivation ("Clear Local License")**:
  - Built-in `Deactivate License` button to clear and unlink the local license from the current machine without reinstalling.
  - Automatically resets application state to unregistered/trial mode.
* **All-in-One Standalone Setup & In-App Auto-Updates**:
  - Single standalone setup installer (~80 MB) with zero external runtime requirements.
  - Auto-update support through GitHub release manifests (`latest.yml`).

### 📥 Downloads
| File | Description | Size |
| :--- | :--- | :--- |
| **`MathEdType-Setup-v0.1.65.exe`** | Versioned standalone installer | 80.67 MB |
| **`MathEdType-Setup.exe`** | Latest generic standalone installer | 80.67 MB |
| **`latest.yml`** | Auto-updater release manifest | 352 B |

### 🛠️ Verification & SHA256 Checksum
* `54BEA7AEDED8C4CE0266C68A5D8EB865AEF2A4E277B7A3AF767CC3CC9F7E0287`

