# 🚀 Node.js Managed Deployment Guide (No VPS)

This guide is for deploying your application to managed **Node.js Platforms** (PaaS) or **Shared Hosting** with Node.js support. These methods do **NOT** require a VPS, Docker, or manual server management.

## 🌟 Recommended Platforms

### 1. Railway (Easiest & Most Reliable)
Railway is a "Node.js only" deployment platform. It connects to your GitHub and handles everything.
1. **Export to GitHub**: In AI Studio, go to **Settings** > **Export to GitHub**.
2. **Connect to Railway**: Go to [railway.app](https://railway.app), login with GitHub, and click **New Project** > **Deploy from GitHub repo**.
3. **Add Persistent Storage**:
   - In Railway, click **+ Add** > **Volume**.
   - Mount it at `/app/data`. This ensures your database (users, orders) is not deleted when the app restarts.
4. **Environment Variables**: Add your `STRIPE_SECRET_KEY`, `JWT_SECRET`, etc., in the **Variables** tab.

### 2. Render (Free Tier Available)
Render is similar to Railway and very easy to set up.
1. **Connect GitHub**: Go to [render.com](https://render.com) and create a new **Web Service**.
2. **Settings**:
   - **Build Command**: `npm run build`
   - **Start Command**: `npm run start:prod`
3. **Persistent Disk**: Go to the **Disk** tab and add a disk mounted at `/app/data`.

### 3. Hostinger (Managed Node.js Hosting)
If you have a Hostinger "Business" or "Cloud" plan with the **Node.js Selector**:
1. **Upload Files**: Use the **File Manager** to upload your project to `public_html`.
2. **Create App**: Go to **Advanced** > **Node.js** and create an app.
   - **Startup File**: `app.js`
   - **App Root**: `public_html`
3. **Build**: Click the **NPM Install** button. I have automated the build process so it happens automatically when you click this.

---

## 🛠️ Why this works for "Node.js Only":
- **No Docker Required**: These platforms read your `package.json` and run `npm install` and `npm run build` automatically.
- **Auto-Scaling**: They handle traffic spikes for you.
- **SSL Included**: You get a free `https://` address automatically.
- **Zero Maintenance**: You don't need to update Linux, install firewalls, or manage SSH keys.

## 📝 Configuration Summary
- **Entry Point**: `app.js` (Root)
- **Build Command**: `npm run build`
- **Output Folders**: `dist-client` (Frontend) and `dist-server` (Backend)
- **Database Location**: `/app/data/izoneae_db.sqlite` (Ensure this folder is persistent!)
