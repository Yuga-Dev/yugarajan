# Yuga Rajan S · Portfolio

Personal site: **https://yuga-dev.github.io/yugarajan**

Senior Software Engineer working on agentic AI (multi-agent orchestration, RAG, MCP) and the .NET and Azure backends behind it.

## Structure

| Path | What it is |
| --- | --- |
| `index.html` | The whole site: markup, styles and scripts in one file, no build step |
| `assets/` | Portrait, link-preview image, touch icon, resume PDF |
| `assets/fonts/` | Self-hosted Bricolage Grotesque and IBM Plex (latin subset) |
| `resume/resume.html` | Source for the resume PDF |
| `resume/build.ps1` | Renders the resume PDF with headless Edge or Chrome |

## Run locally

Open `index.html` in a browser, or serve the folder:

```
npx serve .
```

## Update the resume PDF

Edit `resume/resume.html`, then from the repo root:

```
powershell -ExecutionPolicy Bypass -File resume/build.ps1
```

This writes `assets/Yuga-Rajan-S-Resume.pdf`, which the site's download buttons link to.

## Analytics

Cookie-free page and click counts via GoatCounter. Set `GOATCOUNTER_CODE` near the top of `index.html` to enable it; while it is empty nothing loads.
