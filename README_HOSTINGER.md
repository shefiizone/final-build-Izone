# 🚀 Hostinger Deployment Guide for Next.js

Since you are using **Hostinger**, follow these exact steps to deploy your Next.js application.

## 1. Export Your Project
1. In AI Studio, click on the **Settings** menu (gear icon) in the top right.
2. Select **Export to ZIP**.
3. Extract the downloaded `.zip` file on your computer.

## 2. Upload to Hostinger
1. Log in to your Hostinger **hPanel**.
2. Go to **Files** > **File Manager**.
3. Upload all extracted files to your domain's root folder (usually `public_html`).
   *(Do not upload the `node_modules` or `.next` folders to save time).*

## 3. Configure Node.js in Hostinger
1. In hPanel, go to **Advanced** > **Node.js**.
2. Click **Create Application**.
3. Fill in these details:
   - **Application root:** `public_html` (or the folder where you uploaded the files)
   - **Application URL:** (Select your Domain)
   - **Application startup file:** `server.js`
   - **Node.js version:** Select `18.x` or higher.
4. Click **Create**.

## 4. Install & Build
1. Once the app is created, click the **NPM Install** button in the Hostinger panel. Wait for it to finish.
2. Next, you need to build the app. In the Hostinger Node.js panel, find the **Run NPM command** section.
3. Type `build` and click **Run**. Wait for the build process to finish.

## 5. Add Environment Variables
In the Hostinger Node.js panel, find the **Environment variables** section and add:
- `NODE_ENV` = `production`
- `PORT` = (Hostinger will usually assign a port, but you can leave this blank or use what they provide)

## 6. Start the App
1. Click **Save**.
2. Click **Restart** on your Node.js application.

Your Next.js store is now live on Hostinger!
