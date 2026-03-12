# Deploying to Railway

Railway is an excellent choice for hosting this application. Since this app uses a local SQLite database and local file uploads, you **must** configure a persistent volume to avoid losing data when the app redeploys.

## Step-by-Step Guide

### 1. Connect your GitHub Repository
1. Go to [Railway.app](https://railway.app/) and log in.
2. Click **New Project** -> **Deploy from GitHub repo**.
3. Select your repository.
4. Railway will automatically detect the project and start building it using Nixpacks (as configured in `railway.json`).

### 2. Add a Persistent Volume (CRITICAL)
If you skip this step, your database and uploaded images will be deleted every time you push an update!

1. In your Railway project dashboard, click on your deployed service.
2. Go to the **Settings** tab.
3. Scroll down to **Volumes**.
4. Click **Add Volume**.
5. Set the **Mount Path** to: `/app/data`
6. Click **Add**.

### 3. Set Environment Variables
1. Go to the **Variables** tab in your Railway service.
2. Add the following variables:
   - `NODE_ENV` = `production`
   - `UPLOADS_DIR` = `/app/data/uploads` *(This ensures uploads are saved inside the persistent volume)*
   - `JWT_SECRET` = *(Generate a random secure string)*
   - `STRIPE_SECRET_KEY` = *(Your Stripe Secret Key)*
   - `VITE_STRIPE_PUBLISHABLE_KEY` = *(Your Stripe Publishable Key)*
   - `APP_URL` = *(Your Railway public domain, e.g., `https://your-app.up.railway.app`)*

### 4. Generate a Public Domain
1. Go to the **Settings** tab.
2. Under **Networking**, click **Generate Domain** (or add your custom domain).
3. Update your `APP_URL` environment variable to match this domain.

### 5. Redeploy
1. Railway will automatically redeploy when you add variables or volumes.
2. Once the deployment is green, your app is live and your data is safe!
