## MathEd Type v0.1.63 - All-in-One Windows Installer

This release provides the standalone all-in-one setup installer for **MathEd Type**, bundling the desktop application, Microsoft Word and PowerPoint COM add-in, and OLE equation server.

### 🌟 What's New & Included
* **License Information & Expiration UI**:
  - Direct access anytime via `Help` -> `License Information...` (`ព័ត៌មានអាជ្ណ្ណប័ណ្ណ`).
  - Clear visual expiration date display (e.g. `18/10/2027`) and days remaining countdown (`365d left` / `នៅសល់ 365 ថ្ងៃ`).
  - Active / Expired status indicators with bilingual Khmer and English labels.
  - 1-Click Copy Machine ID button for streamlined key generation.
  - Built-in renewal / license key update form.
  - Real-time license status badge in the bottom status bar.
* **All-in-One Setup**: A single self-contained setup `.exe` (~80 MB) ready to install on any Windows 10 or Windows 11 computer with zero manual developer setup.
* **Microsoft Word & PowerPoint Ribbon Add-in**: Automatically registers and activates ribbon commands for inserting inline and display equations.
* **OLE 2.0 Equation Editing**: Double-clicking an inserted equation in Word automatically launches MathEd Type to edit the equation and updates the document seamlessly.
* **Optimized Startup Behavior**: MathEd Type no longer auto-launches in the background when Word starts up. It launches strictly when an equation is created or edited.
* **In-App Auto Updates**: Built-in support for checking and downloading updates directly from the Help menu with `latest.yml` manifests.
* **Per-User Setup**: Installs to `%LOCALAPPDATA%\Programs\MathEd Type` without requiring administrator privileges or UAC prompts.
* **Built-in Uninstaller**: Fully integrated with Windows Settings and Control Panel for clean removal.

### 📥 Downloads
| File | Description | Size |
| :--- | :--- | :--- |
| **`MathEdType-Setup-v0.1.63.exe`** | Versioned standalone installer | 80.66 MB |
| **`MathEdType-Setup.exe`** | Latest generic standalone installer | 80.66 MB |
| **`latest.yml`** | Auto-updater release manifest | 352 B |

### 🛠️ Verification & SHA256 Checksum
* `32E6B4DB31FD2408FA598DBB0098FEEB56AAA942B64CBF3BF685E45D40854A54`
