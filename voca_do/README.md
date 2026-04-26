<div align="center">

# 🚀 VocaDo  
### 🎙️ Your AI-Powered Task Manager

<img src="https://media.giphy.com/media/ZVik7pBtu9dNS/giphy.gif" width="350"/>

> ✨ Speak. Understand. Execute.

---

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-2.x-blue?logo=dart)
![Supabase](https://img.shields.io/badge/Supabase-Backend-green?logo=supabase)
![AI](https://img.shields.io/badge/AI-Powered-purple)
![Architecture](https://img.shields.io/badge/Clean-Architecture-orange)

</div>

---

## 🧠 Overview

**VocaDo** is a next-generation task management app that transforms **voice commands into structured, actionable tasks** using Artificial Intelligence.

Instead of typing tasks manually, users simply speak — and the system intelligently processes, understands, and assigns tasks.

---

## 🎯 Vision

> Build a system where **human language becomes system logic**

---

## ⚡ Features

### 🔐 Authentication & Roles
- Secure login via Supabase
- Role-based routing:
  - 🛠️ Admin → Voice Control
  - 👨‍💻 User → Task Dashboard

---

### 🎙️ AI Voice Processing (Admin)
- Record voice commands
- Convert speech → text
- AI analyzes intent
- Returns structured JSON:

```json
{
  "task": "Update the design in Figma",
  "assignee": "Leen",
  "due_date": "2026-04-23"
}


┌──────────────────────┐
│   auth.users         │
│----------------------│
│ id (uuid) PK         │
│ email                │
│ password             │
└─────────┬────────────┘
          │ 1
          │
          │
          ▼
┌──────────────────────┐
│      users       │
│----------------------│
│ id (uuid) PK/FK      │◄──────────────┐
│ name text            │               │
│ email text           │               │
│ role user_role       │               │
│ created_at           │               │
└─────────┬────────────┘               │
          │ 1                         │ 1
          │                           │
          │                           │
   ┌──────┴──────────┐        ┌───────┴──────────┐
   ▼                 ▼        ▼                  ▼

        ┌──────────────────────────────┐
        │           tasks              │
        │------------------------------│
        │ id uuid PK                  │
        │ title text                  │
        │ assignee_id FK ─────────────┘ (users.id)
        │ created_by FK ──────────────┘ (users.id)
        │ due_date date               │
        │ status task_status          │
        │ created_at                  │
        └──────────────────────────────┘


## 👥 Team

<div align="center">

| 👤 Name         | 💼 Role      |
|----------------|-------------|
| Leen Alsaleh   | Developer   |
| Ghayda         | Developer   |
| Khaled         | Developer   |

</div>

---
