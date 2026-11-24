# TRUTHSCAN AI

> **"Don't Just Believe It. Verify It."**

An AI-powered public information verification web application engineered to help citizens verify misinformation, misleading news, suspicious viral messages, and fraudulent online schemes.

---

## ⚡ Powered by Google Gemini API

TruthScan AI is now equipped with live Google Gemini API integration:
- **Models Supported**:
  - `gemini-4-hydrogen` *(Default / Recommended)*: Fast, balanced frontier performance for agentic, multimodal & fact-checking tasks.
  - `gemini-4-argon`: Frontier reasoning model for complex evidence synthesis.
  - `gemini-3.5-flash-lite`: Ultra-fast, lightweight high-speed execution.
- **Multimodal Claim & Image Verification**: Direct visual inspection of uploaded viral screenshots, memes, and fake circulars to detect font tampering, dates, and fraudulent stamps.
- **Structured Outputs**: Strict JSON Schema enforcement returning credibility status (`SUPPORTED BY EVIDENCE`, `FALSE OR CONTRADICTED`, `MISLEADING OR MISSING CONTEXT`, `UNVERIFIED`), confidence ratings, identified claims, contradictory facts, missing context, and cited sources.
- **Bilingual Rationale**: Dynamic synthesis in both **English** and **Hindi (हिंदी)** based on user language preference.
- **Resilient Fallback**: Zero-crash architecture — works in live Gemini mode with an API key, or gracefully falls back to baseline demonstration scenarios.

---

## 🚀 Quick Start (Zero Setup on Windows)

1. Double-click:
   📁 `launch_truthscan.bat`
2. Your browser will automatically open:
   ```text
   http://localhost:4173
   ```
3. Click the **✨ Gemini AI: Demo Mode** button in the top navbar to paste your free Google AI Studio API key and unlock live multimodal fact-checking!

---

## 🌟 Key Highlights & Features

- **Exactly Three Main Screens**:
  1. **Home / Verification Dashboard**: Hero headline, multi-mode verification input card (Text, Image, URL), sample claim presets, 3-step guide, and public safety notice.
  2. **Analysis / Verification Results**: Credibility assessment badge (4 states: *Supported by Evidence*, *False or Contradicted*, *Misleading or Missing Context*, *Unverified*), confidence meter with disclaimer, key findings (claims, observations, contradictions, missing context), detailed source cards with source modal, plain-language AI explanation, recommended precautions, and Copy/Share action buttons.
  3. **How It Works / About**: Mission statement, 4-stage verification lifecycle, 4 verification categories, 6 core design pillars, and explicit accuracy & ethical transparency guidelines.
- **Visual Identity**:
  - **Primary Colour**: Deep Navy (`#101B35`)
  - **Secondary Colour**: Electric Blue (`#3867F5`)
  - **Background**: Light Grey (`#F6F8FC`)
  - **Cards**: Pure White (`#FFFFFF`) with subtle shadows and clean borders
  - **Indicators**: Green (Supported), Amber (Misleading), Red (Contradicted), Grey (Unverified)
- **Zero Technical Knowledge Required**: Designed specifically for students, teachers, parents, farmers, working professionals, and general internet users.
- **Bilingual Interface**: Full, seamless instant switching between **English** and **Hindi (हिंदी)** across every component and screen.
- **Interactive Demonstrations**:
  - Interactive sample claims covering all four verdict outcomes.
  - Interactive sample image analysis with pre-loaded viral graphic examples.
  - Interactive sample URL analysis with phishing and verified government domains.
  - Multi-step animated progress overlay ("Extracting claims...", "Cross-referencing databases...", "Synthesizing evidence...").
  - Clipboard copy with toast notification and native Web Share API with clipboard fallback.

---

## 📁 Project Architecture

```
truthscan-ai/
├── public/
│   ├── app.css                 # Standalone responsive SaaS stylesheet
│   ├── app.js                  # Standalone reactive application engine
│   ├── index.html              # Standalone web app entry point
│   └── shield.svg              # TRUTHSCAN AI brand icon
├── src/
│   ├── components/
│   │   ├── Navbar.tsx          # Brand, navigation, language selector & mobile drawer
│   │   ├── Footer.tsx          # Target audience, ethics disclaimers, links & modals
│   │   ├── VerificationInput.tsx # 3-tab card (Text, Image upload preview, URL, Loading)
│   │   ├── ResultCard.tsx      # Credibility card (Green, Red, Amber, Grey + Confidence)
│   │   ├── SourceCard.tsx      # Individual source cards with View Source modal
│   │   ├── LanguageSelector.tsx # English / Hindi toggle
│   │   └── Icons.tsx           # Lucide React SVG icon suite
│   ├── pages/
│   │   ├── Home.tsx            # Screen 1: Verification Dashboard
│   │   ├── Results.tsx         # Screen 2: Verification Analysis Results
│   │   └── About.tsx           # Screen 3: How It Works & Transparency
│   ├── data/
│   │   ├── mockResults.ts      # 4-state verification scenarios & dynamic matching
│   │   └── translations.ts     # Complete English & Hindi translations
│   ├── hooks/
│   │   └── useLanguage.ts      # Language state & persistence hook
│   ├── App.tsx                 # Screen routing, analysis orchestrator & toasts
│   ├── index.css               # Tailwind CSS base styles & variables
│   └── main.tsx                # React 18 DOM entry point
├── index.html                  # Vite application root
├── standalone.html             # Zero-dependency browser runner (double-click to open!)
├── serve.js                    # Built-in lightweight local preview server
├── package.json                # Project dependencies and build scripts
├── tsconfig.json               # TypeScript compiler configuration
├── tailwind.config.js          # Tailwind CSS theme extension
├── postcss.config.js           # PostCSS configuration
├── vite.config.ts              # Vite dev server configuration
└── README.md                   # Complete documentation
```

---

## 🚀 How to Run the Application

### Option 1: Instant Browser Preview (Zero Installation)
Simply open `standalone.html` in any modern web browser (Chrome, Edge, Firefox, Safari).
```
Double-click: C:\Users\ss914\.gemini\antigravity\scratch\truthscan-ai\standalone.html
```
No Node.js, npm, build step, or network connection is required.

### Option 2: Built-in Local Server
Run with the Antigravity Node runtime:
```powershell
cd "C:\Users\ss914\.gemini\antigravity\scratch\truthscan-ai"
agy-node serve.js
```
Then open `http://127.0.0.1:4173` in your browser.

### Option 3: Standard Vite Development Server (with Node & npm)
```bash
cd truthscan-ai
npm install
npm run dev
```

---

## 🧪 Testing the 4 Verdict States

You can immediately test all 4 result states using the preset sample buttons on the homepage:

1. **FALSE OR CONTRADICTED (Red)**
   - Click the *🚨 Fake Phone Scheme* sample chip or paste a claim about free student smartphones.
   - Result: PIB Fact Check debunk confirmation, MeitY phishing registrar alert, detailed contradictions.
2. **MISLEADING OR MISSING CONTEXT (Amber)**
   - Click the *⚠️ RBI ₹500 Note Ban* sample chip.
   - Result: Clarifies that ₹500 notes remain legal tender and the video is an out-of-context 2023 clean note policy circular.
3. **SUPPORTED BY EVIDENCE (Green)**
   - Click the *✅ Fertilizer Subsidy* sample chip.
   - Result: Union Cabinet Committee on Economic Affairs (CCEA) gazette release, ICAR advisories, 96% confidence.
4. **UNVERIFIED (Grey)**
   - Click the *❓ Local Water Supply Rumor* sample chip or type any uncorroborated statement.
   - Result: Identifies lack of official municipal bulletins and recommends contacting civic helplines.

---

## 🔒 Ethical & Transparency Guidelines

- **Assistant Tool Only**: TruthScan AI assists human verification; it does not replace official channels.
- **Confidence Disclaimer**: AI confidence scores represent evidentiary corroboration, never absolute judicial proof.
- **Privacy by Design**: No accounts, passwords, or personal identifying data are collected or required.
