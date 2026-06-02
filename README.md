# 🦸‍♂️ Hero Randomizer

<div align="center">
  <img src="https://img.shields.io/badge/Platform-iOS-000000?style=for-the-badge&logo=apple&logoColor=white" alt="Platform" />
  <img src="https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white" alt="Swift" />
  <img src="https://img.shields.io/badge/Architecture-MVVM-4CAF50?style=for-the-badge" alt="MVVM" />
  <img src="https://img.shields.io/badge/Networking-REST_API-007ACC?style=for-the-badge" alt="REST API" />
</div>

<br>

An elegant and dynamic iOS application that fetches and displays detailed profiles of various heroes and characters using a RESTful API. Built with a strong focus on clean architecture and efficient network handling.

## 📱 Visual Showcase

> **Note:** Here is how the application looks and feels in action.

<div align="center">
  
<!-- ======================================================== -->
<img width="282" height="571" alt="Снимок экрана — 2026-06-01 в 17 16 56" src="https://github.com/user-attachments/assets/d61294d2-e46f-449a-b729-fbab0bf81ffc" />

<img width="282" height="569" alt="Снимок экрана — 2026-06-01 в 17 17 16" src="https://github.com/user-attachments/assets/2d29e0ce-e974-4fac-96e6-3c267bc443d0" />

<!-- ======================================================== -->

</div>

## ✨ Key Features

* **Real-time Networking:** Seamlessly fetches character data from a remote REST API.
* **Robust Data Parsing:** Uses Swift's `Codable` for safe and efficient JSON decoding.
* **Clean Architecture:** Strictly follows the **MVVM (Model-View-ViewModel)** design pattern to separate business logic from the UI, making the codebase highly testable and maintainable.
* **Dynamic UI:** Responsive user interface that updates gracefully based on network states (loading, success, error).
* **Image Caching:** Optimized image loading to ensure smooth scrolling and reduced network bandwidth usage.

## 🏗 Architecture Details

This project is structured using the **MVVM** pattern:
* **Model:** Data structures representing the API payloads (`Decodable`).
* **ViewModel:** Handles the network requests, data transformation, and provides prepared data to the View.
* **View:** Purely UI-focused, observing the ViewModel and updating the interface reactively.

## 🚀 Installation & Setup

**1. Clone the repository:**

```bash
git clone [https://github.com/Kissly1/Hero-RandomizerApp.git](https://github.com/Kissly1/Hero-RandomizerApp.git)
```

2. Open the project:
Navigate to the project directory and open the .xcodeproj file in Xcode.

```
cd Hero-RandomizerApp
open HeroRandomizer.xcodeproj
```

3. Build & Run:
Select your preferred iPhone simulator (iOS 15.0+ recommended) and press Cmd + R.


