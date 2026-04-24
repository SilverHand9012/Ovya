# 🌸 Ovya — Offline-First AI PCOS Health Companion

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Firebase](https://img.shields.io/badge/Firebase-Firestore%20%7C%20Auth-orange?logo=firebase)
![AI](https://img.shields.io/badge/AI-Gemini%202.5%20Flash-purple)
![Offline First](https://img.shields.io/badge/Architecture-Offline--First-green)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey)
![Status](https://img.shields.io/badge/Status-Production--Ready-success)

> Built for **Google Solution Challenge 2026**  
> 🌍 SDG 3 · SDG 5 · SDG 10

---

# 🧠 Problem

PCOS affects **1 in 5 women in India**, yet diagnosis often takes **2+ years**.

For women in rural and underserved areas:

- 📶 Limited or no internet access  
- 🏥 Lack of nearby specialists  
- 💰 High consultation costs  
- 🌐 Language barriers (most apps are English-only)

👉 Result: **Delayed diagnosis, unmanaged symptoms, long-term health risks**

---

# 🌱 Solution — Ovya

Ovya is an **offline-first, AI-powered women’s health companion** designed specifically for **low-connectivity environments**.

It enables:
- Early PCOS risk detection  
- Continuous symptom tracking  
- AI-driven guidance  
- Doctor-ready reports  

— all **without requiring internet access**

---

# 🏆 Why Ovya Stands Out (GSC Impact)

| Criteria        | How Ovya Delivers |
|----------------|------------------|
| **Impact**     | Targets underserved women with real access gaps |
| **Innovation** | Offline-first AI + sync queue architecture |
| **Feasibility**| Built with scalable Firebase + Flutter stack |
| **Scalability**| Multi-language + cloud sync + modular architecture |

---

# ✨ Core Features

## 🧠 Offline PCOS Detection
- Rule-based screening engine  
- Instant results  
- Works 100% offline  

---

## 📊 Symptom Tracking
- Local-first logging (Isar DB)  
- No data loss  
- Rich symptom + mood tracking  

---

## 🔄 Intelligent Sync Engine
- Queue-based architecture  
- Exponential backoff (2G-safe)  
- Idempotent writes using `clientId`  
- Multi-device safe  

---

## 🤖 AI Health Assistant (Ask Ovya)
- Powered by Gemini 1.5 Flash  
- Context-aware responses  
- Cached insights for offline use  

---

## 📄 Clinical Report Generator
- Fully on-device PDF generation  
- Structured for doctor consultations  
- Multilingual + Unicode-safe  

---

## 🌍 Multilingual by Design
- English, Hindi, Marathi, Kannada, Telugu  
- Native font rendering  
- Emotionally adaptive translations  

---

# 🎬 Demo Flow

1. Turn **OFF internet**
2. Complete PCOS screener → get **instant result**
3. Log symptoms offline
4. Turn internet **ON**
5. Watch seamless **auto-sync to Firebase**
6. Generate **doctor-ready report**
7. Use **Ask Ovya AI assistant**

👉 Fully functional even in low-connectivity scenarios

---

# 🏗️ Architecture (Offline-First Core)


Flutter UI (Riverpod)
↓
Connectivity Orchestrator
↙ ↘
Isar DB Firestore
(always) (when online)
↖ ↗
Sync Queue
↓
Gemini AI (cached locally)


---

# 🔐 Security & Data Integrity

- Firebase Authentication (user isolation)
- Strict Firestore Rules (field validation)
- Queue clearing on logout (prevents leaks)
- Idempotent sync with `clientId`

---

# 🛠️ Tech Stack

| Layer            | Technology |
|------------------|-----------|
| Frontend         | Flutter (Material 3) |
| State Management | Riverpod |
| Local Storage    | Isar |
| Backend          | Firebase Firestore + Auth |
| AI               | Gemini 1.5 Flash |
| Connectivity     | connectivity_plus |
| Reports          | PDF + Printing |

---

# 🌍 SDG Alignment

### 🟢 SDG 3 — Good Health
Early detection improves long-term outcomes

### 🟣 SDG 5 — Gender Equality
Addresses underdiagnosed women’s health issues

### 🟡 SDG 10 — Reduced Inequalities
Works in low-resource, low-connectivity regions

---

# ⚠️ Disclaimer

Ovya provides **informational guidance only** and does not replace professional medical advice.

---

# 🚀 Vision

To build a future where:
> Healthcare is **accessible, intelligent, and private** — regardless of internet, language, or geography.

---

# ⭐ What Makes This Project Special

Ovya is not a prototype.

It is a **production-ready system** that proves:
- Offline-first design can scale  
- AI can work without constant connectivity  
- Healthcare tools can be inclusive by default  

---

# 👩‍💻 Built For

- Women in rural and underserved regions  
- Low-connectivity environments  
- Real-world healthcare constraints  

---

# 💬 Final Thought

> The problem was never lack of technology.  
> It was lack of accessibility.

Ovya fixes that.