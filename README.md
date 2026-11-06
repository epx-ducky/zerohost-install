# ZeroHost – Installation

ZeroHost ist eine KI, die komplett auf deinen eigenen Rechnern läuft: Keine Cloud, keine Daten verlassen das Haus.
Dieses Repository enthält nur die Installer und die fertigen Pakete (unter [Releases](../../releases)).

## macOS (Apple-Chip M1 oder neuer, ab 24 GB RAM empfohlen)

Terminal öffnen und einfügen:

```bash
curl -fsSL https://raw.githubusercontent.com/epx-ducky/zerohost-install/main/install.sh | sh
```

Das installiert **ZeroHost.app** in *Programme* und startet die App. Oben in der Menüleiste erscheint ZeroHost,
das Dashboard öffnet sich im Browser. Beim ersten Start lädt ZeroHost einmalig das passende Modell (12–15 GB).

Alternativ von Hand: `ZeroHost-macos-arm64.dmg` aus den [Releases](../../releases) laden, ZeroHost in *Programme*
ziehen. Die App ist noch nicht von Apple notarisiert: beim ersten Start Rechtsklick → *Öffnen*.

## Linux (x86_64 oder aarch64; Ubuntu 20.04+, Debian 11+, RHEL 8+)

```bash
curl -fsSL https://raw.githubusercontent.com/epx-ducky/zerohost-install/main/install.sh | sh
zerohost-app            # Dashboard auf http://127.0.0.1:8420
```

Für die KI selbst braucht Linux zusätzlich **llama.cpp** (`llama-server` im PATH) oder **vLLM** mit NVIDIA-GPU.
Hinweise stehen nach der Installation in `~/.local/share/zerohost/LIESMICH.txt`.

## Windows (64 Bit, ab 16 GB RAM)

PowerShell öffnen und einfügen:

```powershell
irm https://raw.githubusercontent.com/epx-ducky/zerohost-install/main/install.ps1 | iex
```

Das installiert ZeroHost nach `%LOCALAPPDATA%\ZeroHost`, legt eine Verknüpfung **ZeroHost** auf den Desktop und
startet es. Beim ersten Start lädt ZeroHost llama.cpp und das Modell, das zu Grafikkarte und RAM passt.
Das Fenster offen lassen, solange ZeroHost laufen soll.

## Nach dem Start

1. Im Browser öffnet sich `http://127.0.0.1:8420`.
2. Beim ersten Mal legst du das Admin-Konto an.
3. Sobald das Modell geladen ist (Fortschritt im Dashboard), kannst du chatten.

## Entfernen

- **macOS:** ZeroHost.app aus *Programme* löschen. Daten: `~/Library/Application Support/zerohost`, `~/.zerohost`.
- **Linux:** `~/.local/share/zerohost/install.sh --uninstall`
- **Windows:** Ordner `%LOCALAPPDATA%\ZeroHost` und Desktop-Verknüpfung löschen. Daten: `%USERPROFILE%\.zerohost`.

## Status

Beta. Fehler und Fragen bitte als [Issue](../../issues) melden.
