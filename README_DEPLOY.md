# GitHub Deployment Guide (IZONEAE)

This project is configured for multiple deployment options using GitHub.

## 🐳 Option 1: VPS Deployment via Docker (Recommended for Node.js)

If you have a VPS (Hostinger VPS, DigitalOcean, etc.), use the Docker workflow.

1.  **Prepare your VPS**:
    -   Install Docker and Docker Compose.
    -   Create a `docker-compose.yml` on your server.
2.  **Add Secrets to GitHub**:
    -   `VPS_HOST`: Your server IP.
    -   `VPS_USERNAME`: Usually `root`.
    -   `VPS_SSH_KEY`: Your private SSH key.
3.  **Push to `main`**: The `.github/workflows/vps-deploy.yml` action will build a Docker image, push it to GitHub Container Registry (GHCR), and then SSH into your server to pull and restart the app.

---

## ☁️ Option 2: Render or Railway (Easiest for Node.js)

These platforms connect directly to your GitHub repository and don't require an Action file.

1.  **Railway**:
    -   Connect your repo.
    -   Railway will read `railway.json`.
    -   **CRITICAL**: Add a **Volume** mounted at `/app/data` to keep your database safe.
2.  **Render**:
    -   Connect your repo.
    -   Render will read `render.yaml`.
    -   It will automatically create a **Disk** for persistent storage.

---

## 🛠️ Continuous Integration (CI)

We have added a `.github/workflows/node-ci.yml` file that runs on every push and pull request. It ensures:
-   The project builds successfully.
-   There are no TypeScript or Linting errors.
-   This prevents broken code from being merged or deployed.
