<p align="center">
  <img src="https://files.catbox.moe/cukyf4.jpg" alt="V4Z Web Ripper Banner" width="100%">
</p>

<h1 align="center">🕷️ V4Z WEB RIPPER</h1>
<p align="center"><b>Website Source & Asset Downloader for Termux</b></p>

<p align="center">
  <img src="https://img.shields.io/badge/Termux-Ready-00ff41?style=for-the-badge&logo=android" alt="Termux Ready">
  <img src="https://img.shields.io/badge/Python-3-00ff41?style=for-the-badge&logo=python" alt="Python 3">
  <img src="https://img.shields.io/badge/No%20pip%20deps-000000?style=for-the-badge" alt="No dependencies">
  <img src="https://img.shields.io/badge/License-MIT-00ff41?style=for-the-badge" alt="MIT">
</p>

<p align="center">
  <a href="https://t.me/rashdteem"><img src="https://img.shields.io/badge/Telegram-Channel-229ED9?style=for-the-badge&logo=telegram" alt="Telegram"></a>
</p>

---

## ⚡ What is this?

**V4Z Web Ripper** downloads a website's publicly accessible source — HTML pages, CSS, JavaScript, images and fonts — and rewrites every link so you can **browse the copy fully offline**. Perfect for studying how websites are built, keeping offline copies of your own projects, and learning web development.

> **Zero dependencies.** Pure Python standard library. No `pip install` needed.

## ✨ Features

- 🌐 **Single page or full crawl** — rip one page or crawl a whole site (same domain)
- 🎨 **Asset downloader** — CSS, JS, images, fonts, media, all organized in folders
- 🔗 **Smart link rewriting** — offline copy works like the real site
- 🧵 **Threaded downloads** — fast parallel fetching
- 🤖 **robots.txt aware** — respects disallow rules automatically
- 📝 **Form detector** — lists forms found on pages (info only)
- ⌨️ **CTRL+C safe** — partial results are kept
- 📦 **Termux native** — one-line install

## 📲 Installation (Termux / Linux)

```bash
curl -fsSL https://raw.githubusercontent.com/v4zrashd/RASHDWebRipperTermuxx/main/install.sh | bash
```

## 🚀 Usage

```bash
# Rip a single page + its assets
v4zrip https://example.com --single

# Crawl the site (depth 1, up to 20 pages)
v4zrip https://example.com

# Deeper crawl, more pages
v4zrip https://example.com -d 2 -p 50

# Custom output folder & threads
v4zrip https://example.com -o my_copy -t 12
```

### Options

| Flag | Description | Default |
|------|-------------|---------|
| `--single` | Rip one page only | off |
| `-d, --depth` | Crawl depth (`0` = single page) | `1` |
| `-p, --max-pages` | Max pages to save | `20` |
| `-o, --output` | Output folder | `./<host>_rip` |
| `-t, --threads` | Download threads | `8` |
| `-q, --quiet` | Less output | off |

### Output structure

```
example.com_rip/
├── site/                 # rewritten HTML pages (open index.html offline)
│   ├── index.html
│   └── page2.html
└── assets/
    ├── css/
    ├── js/
    ├── images/
    ├── fonts/
    └── media/
```

## 🗑️ Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/v4zrashd/RASHDWebRipperTermuxx/main/uninstall.sh | bash
```

## ⚠️ Disclaimer

This tool is for **educational purposes and authorized use only**. Only download websites you own or have explicit permission to copy. Respect copyright law, website terms of service and `robots.txt`. The author is not responsible for misuse.

## 📢 Telegram

**Channel:** https://t.me/rashdteem

---

<p align="center"><b>👨‍💻 By V4Z RASHD</b></p>
