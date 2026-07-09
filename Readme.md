# Oh My Posh — PowerShell Setup

Sets up the **m365pnp** Oh My Posh theme for both **PowerShell 7** and **Windows PowerShell 5.1**.

## Repo Contents

| File                               | Purpose                                |
| ---------------------------------- | -------------------------------------- |
| `Themes/m365pnp.omp.json`          | The Oh My Posh theme                   |
| `Microsoft.PowerShell_profile.ps1` | Profile for **PowerShell 7**           |
| `Windows.PowerShell_profile.ps1`   | Profile for **Windows PowerShell 5.1** |

---

## Setup on a New Laptop

### 1. Install prerequisites

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
oh-my-posh font install CascadiaMono   # installs "CaskaydiaMono Nerd Font"
```

Restart the terminal after install.

### 2. Set the terminal font

Windows Terminal → **Settings → your profile → Appearance → Font face** → **CaskaydiaMono Nerd Font**
(Set it for both PowerShell and Windows PowerShell profiles.)

### 3. Copy the theme locally

The theme file (`Themes/m365pnp.omp.json`) is already backed up in this repo. You can get it in one of two ways:

**Option A — PowerShell (from the cloned repo folder - https://github.com/ejazhussain/ohmyposh):**

```powershell
New-Item -ItemType Directory -Path "$HOME\.poshthemes" -Force
Copy-Item ".\Themes\m365pnp.omp.json" "$HOME\.poshthemes\" -Force
```

**Option B — Manually:**

Open `Themes/m365pnp.omp.json` in the cloned repo (https://github.com/ejazhussain/ohmyposh), then copy the file to `%USERPROFILE%\.poshthemes\` using File Explorer.

> The theme now lives locally — no GitHub dependency at runtime.

### 4. Install the profiles

> **Note:** On a new machine the profile folders may not exist yet. Check in File Explorer under `Documents` — if `PowerShell` or `WindowsPowerShell` folders are missing, create them manually before copying the files, or let the `New-Item` commands below create them automatically.

Run each command in its **matching** shell so `$PROFILE` resolves correctly.

**PowerShell 7 (pwsh):**

```powershell
# Creates the folder and file if they don't exist
New-Item -ItemType File -Path $PROFILE -Force
Copy-Item ".\Microsoft.PowerShell_profile.ps1" $PROFILE -Force
```

**Windows PowerShell 5.1:**

```powershell
# Creates the folder and file if they don't exist
New-Item -ItemType File -Path $PROFILE -Force
Copy-Item ".\Windows.PowerShell_profile.ps1" $PROFILE -Force
```

**Create folders manually (if needed):**

| Shell | Folder to create under `Documents\` |
| ----- | ------------------------------------ |
| PowerShell 7 | `PowerShell` |
| Windows PowerShell 5.1 | `WindowsPowerShell` |

> ⚠️ The target file **must** be named `Microsoft.PowerShell_profile.ps1` in both cases — using `$PROFILE` as the path handles this automatically.

### 5. Allow scripts (Windows PowerShell 5.1 only)

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

### 6. Reload

```powershell
. $PROFILE
```

The m365pnp prompt should now appear. ✅

---

## Verify / Troubleshoot

```powershell
Test-Path $PROFILE                                # profile found?  -> True
Test-Path "$HOME\.poshthemes\m365pnp.omp.json"    # theme found?    -> True
oh-my-posh version                                # oh-my-posh on PATH?
```

- **Boxes instead of icons** → font not set in the terminal.
- **Profile ignored** → wrong filename/extension (enable _File Explorer → View → File name extensions_).
