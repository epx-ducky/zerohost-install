# ZeroHost – Installation

ZeroHost ist eine KI, die komplett auf deinen eigenen Rechnern läuft: Keine Cloud, keine Daten verlassen das Haus.
Gebaut für alle mit Schweigepflicht: Kanzleien, Praxen, Steuerberater und Firmen, die Kunden- oder Patientendaten
nicht an einen Cloud-Dienst schicken dürfen.

Dieses Repository enthält nur die Installer und die fertigen Pakete (unter [Releases](../../releases)).

## Was ZeroHost kann

**Chat wie ChatGPT, nur lokal**
- Fragen, Texte schreiben, zusammenfassen, übersetzen, Code schreiben – im Browser unter `127.0.0.1:8420`.
- Große Aufgaben (z. B. „bau mir ein kleines Spiel“ oder eine Webseite) plant ZeroHost, teilt sie auf mehrere
  KI-Agenten auf, prüft das Ergebnis und bessert Fehler selbst nach.
- Bilder erzeugen: „Generiere ein Bild von …“ oder `/bild …`.
- Gesetze offline: eine Sammlung von 50 deutschen Gesetzen, aus der ZeroHost bei Rechts-, Steuer- und
  Medizinfragen den passenden Paragrafen zitiert.

**Fürs Büro**
- **Postfach:** E-Mails abholen (IMAP), sortieren, Fristen erkennen, Antworten vorschlagen. Gesendet wird erst
  nach deinem Klick.
- **Kanzlei:** Posteingang-Assistent, Fristenkontrolle mit Kalender-Export (`.ics`), Briefentwürfe.
  Keine Frist gilt, bevor ein Mensch sie bestätigt hat.
- **Dokumente:** Briefe, Angebote und Rechnungen mit eigenem Briefkopf als PDF.
- **Automationen:** wiederkehrende Aufgaben, die im Hintergrund laufen (z. B. Morgen-Briefing).
- **Meine KI:** jede Person im Team hat ihr eigenes Profil (Ton, Anrede, Signatur).

**Team und mehrere Rechner**
- Konten mit Rollen (Admin, Mitarbeiter, Revisor), Anmeldung auch mit Face ID / Touch ID.
- **Intranet:** im Büro-WLAN auf iPhone, iPad und Mac nutzbar wie eine App.
- **Mehrere Macs zusammenschalten:** ZeroHost verteilt die Arbeit auf alle verbundenen Rechner.
  Freie Macs im Büro können kleine, allgemeine Fragen mitbeantworten, vertrauliche bleiben auf dem Server.
- Wenn viel los ist, wechselt ZeroHost automatisch auf ein schnelleres Modell, damit niemand lange wartet.
- **API:** andere Programme (Praxis-Software, Buchhaltung, eigene Skripte) können ZeroHost wie die
  OpenAI-Schnittstelle nutzen.

**Sicherheit**
- Strenger Air-Gap ab Werk: nichts geht ins Internet, außer du gibst es frei.
- Manipulationssicheres Protokoll (signiert), verschlüsselter Datentresor.
- Fremde Werkzeuge (MCP) laufen nur, wenn ein Admin sie geprüft und freigegeben hat.

**Gemessen, nicht versprochen** (Mac mini M4 Pro, 24 GB): Qwen3.6-35B-A3B mit rund 74 Tokens/s,
gpt-oss-20b mit 65–77 Tokens/s – schneller, als man liest.

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
