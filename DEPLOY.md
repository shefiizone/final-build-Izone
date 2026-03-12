# Deployment Instructions

This is a **Full-Stack Node.js Application** (Express + React/Vite + SQLite).
Because it uses a local database (`izoneae_db.sqlite`) and local file uploads, you **MUST** use a hosting provider that supports **Persistent Storage (Volumes)**.

**⚠️ DO NOT deploy to Vercel, Netlify, or AWS Lambda.** Your database and uploads will be deleted every time the app restarts.

---

## ✅ Option 1: Railway (Easiest & Recommended)

Railway automatically detects the `railway.json` file included in this project.

1.  **Push this code to GitHub.**
2.  **Sign up at [Railway.app](https://railway.app)**.
3.  Click **"New Project"** -> **"Deploy from GitHub repo"**.
4.  Select your repository.
5.  **Add a Volume (CRITICAL):**
    -   Go to your project settings -> Service -> **Volumes**.
    -   Click **"Add Volume"**.
    -   Mount Path: `/app/data`
    -   (This ensures your database and uploads are saved permanently).
6.  **Variables**:
    -   Railway will automatically use the variables defined in `railway.json` / `Dockerfile`.
    -   Add `GEMINI_API_KEY` in the "Variables" tab if you use AI features.
    -   Add `JWT_SECRET` (any long random string) for security.

---

## ✅ Option 2: Render

Render automatically detects the `render.yaml` file included in this project.

1.  **Push this code to GitHub.**
2.  **Sign up at [Render.com](https://render.com)**.
3.  Click **"New +"** -> **"Blueprint"**.
4.  Connect your GitHub repository.
5.  Render will read `render.yaml` and ask you to approve the resources.
    -   **Note:** The `render.yaml` defines a **Disk** (Volume) for `/app/data`. This is a paid feature on Render (~$0.25/month minimum). It is REQUIRED for your database to work.
6.  Click **"Apply"**.

---

## ✅ Option 3: VPS (DigitalOcean, Hetzner, Hostinger, EC2)

If you have a Linux server with Docker installed:

1.  **Clone the repo**:
    ```bash
    git clone https://github.com/your-username/your-repo.git
    cd your-repo
    ```
2.  **Build & Run**:
    ```bash
    # Build the image
    docker build -t my-shop .

    # Run with a volume for data persistence
    docker run -d \
      -p 3000:3000 \
      -v $(pwd)/data:/app/data \
      -e NODE_ENV=production \
      -e JWT_SECRET=your_secret_key \
      -e GEMINI_API_KEY=your_api_key \
      --name my-shop-container \
      my-shop
    ```

---

## ❌ Why not Vercel/Netlify?

This app uses **SQLite** (a file-based database) and stores **user uploads** on the disk.
Serverless platforms like Vercel are "ephemeral" — they destroy the server after every request. If you deploy there, your users will lose their accounts and orders immediately.
