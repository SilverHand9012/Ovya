# 🌸 Ovya — AI-Powered PCOS Companion for Underserved Women

> Built for Google Solution Challenge 2026
> SDG 3: Good Health & Well-being · SDG 5: Gender Equality · SDG 10: Reduced Inequalities

---

## 🚨 The Problem

PCOS affects **1 in 5 women in India**, yet diagnosis often takes **2+ years**.

For women in rural and low-resource settings:

* ❌ No nearby specialists
* ❌ Consultations cost ₹800–2000
* ❌ Health apps are English-only
* ❌ Most tools fail without internet

👉 The result: **delayed diagnosis, unmanaged symptoms, and long-term health risks**

**Ovya is built specifically for this reality.**

---

## 🌱 What Ovya Does

Ovya is an **offline-first, multilingual PCOS early detection and health companion** — designed to work anywhere.

* 🧠 **Early Detection (Offline)**

  * Rule-based screening engine (12-question model)
  * Instant PCOS risk scoring
  * Works 100% on-device — no internet required

* 📊 **Symptom Tracking**

  * Log symptoms locally using Isar DB
  * Automatic sync to Firestore when online
  * Zero data loss with sync queue system

* 🤖 **AI Health Insights**

  * Gemini-powered personalized guidance
  * Delivered in user's selected language
  * Cached for offline access

* 📄 **Doctor-Ready Report**

  * Structured clinical summary
  * Share via WhatsApp or print
  * Designed for real doctor handoff

* 🌍 **Multilingual by Design**

  * English, Hindi, Marathi, Kannada, Telugu
  * Built using Flutter localization system

---

## ⚡ Why Ovya Stands Out

| Feature                 | Existing Apps         | Ovya                      |
| ----------------------- | --------------------- | ------------------------- |
| Offline functionality   | ❌                     | ✅ Fully offline-first     |
| Indian language support | ❌ English-only        | ✅ 5 languages             |
| PCOS detection          | ❌ Post-diagnosis only | ✅ Pre-diagnosis screening |
| Doctor integration      | ❌                     | ✅ Clinical report         |
| Target users            | Urban                 | ✅ Rural & underserved     |

---

## 🎬 Demo Flow

1. Turn **OFF internet**
2. Complete screener → get **instant risk result**
3. Log symptoms
4. Turn internet **ON**
5. Watch data **sync live to Firestore**

---

## 🏗️ Architecture

```text
UI (Flutter + Riverpod)
        ↓
Connectivity Orchestrator
   ↙                ↘
Isar DB        Firestore
(always)      (when online)
   ↖                ↗
       Sync Queue
            ↓
      Gemini API
   (cached to local)
```

* Clean architecture
* Feature-first structure
* Fully offline-capable

---

## 🛠️ Tech Stack

| Layer            | Technology                |
| ---------------- | ------------------------- |
| Frontend         | Flutter (Material 3)      |
| State Management | Riverpod + Codegen        |
| Local Storage    | Isar                      |
| Cloud            | Firebase Firestore + Auth |
| AI               | Gemini 1.5 Flash          |
| Connectivity     | connectivity_plus         |
| Localization     | Flutter l10n              |
| Reports          | PDF generation            |

---

## 🌍 SDG Alignment

* **SDG 3** — Early detection improves long-term health outcomes
* **SDG 5** — Focuses on a widely underdiagnosed women's condition
* **SDG 10** — Bridges healthcare access gap in low-connectivity areas

---

## ⚠️ Disclaimer

Ovya provides **informational guidance only** and does not replace professional medical advice.
Users should consult a qualified healthcare provider for diagnosis and treatment.

---

## 🚀 Vision

To make **intelligent, private, and accessible healthcare tools available to every woman — regardless of language, location, or internet access.**
