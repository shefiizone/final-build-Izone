# Hostinger Managed Node.js Deployment Guide

Since you are using Hostinger's **Managed Node.js Plan** (not a VPS), follow these steps to deploy your **IZONEAE** application.

---

## 1. Connect GitHub to Hostinger
1.  Log in to your **Hostinger hPanel**.
2.  Go to **Websites** -> **Manage**.
3.  On the sidebar, look for **Advanced** -> **GIT**.
4.  Connect your GitHub repository to Hostinger.
5.  Set the **Branch** to `main`.
6.  Set the **Install Directory** to `/` (root).

## 2. Configure Node.js Application
1.  In hPanel, go to **Websites** -> **Node.js**.
2.  Click **Create Application** (or manage existing).
3.  **Application Root**: `/` (or the folder where you cloned the code).
4.  **Application URL**: Select your domain.
5.  **Application Startup File**: `server.js`
6.  **Node.js Version**: Select **20.x** or **22.x**.

## 3. Environment Variables
1.  In the same Node.js section, find **Environment Variables**.
2.  Add the following:
    - `NODE_ENV`: `production`
    - `NEXT_PUBLIC_GEMINI_API_KEY`: (Your Gemini API Key)

## 4. Run Build Commands
Hostinger's managed plan allows you to run commands directly:
1.  Click on **NPM Install** to install all dependencies.
2.  Click on **Run Script** and type `build` (this runs `npm run build`).
3.  Once the build is finished, click **Start** or **Restart** to launch the app.

## 5. Automatic Deployment (Webhook)
To make Hostinger update every time you push to GitHub:
1.  In the **GIT** section of hPanel, copy the **Webhook URL**.
2.  Go to your GitHub Repository -> **Settings** -> **Webhooks**.
3.  Click **Add webhook**.
4.  Paste the URL, set Content type to `application/json`, and save.

---

## ⚠️ Troubleshooting for Managed Plans
- **Port**: Hostinger managed plans automatically assign a port. I have updated `server.js` to use `process.env.PORT` so it works perfectly with their system.
- **Build Errors**: If the build fails due to memory limits, you may need to run `npm run build` locally on your computer and upload the `.next` folder via FTP/File Manager instead of building on the server.
- **Static Files**: Ensure `next.config.ts` has `unoptimized: true` for images (already configured) as managed plans sometimes have issues with the default Next.js image optimizer.
