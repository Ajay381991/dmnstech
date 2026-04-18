# Complete Setup: GitHub + Cloudflare Auto-Deployment

## Step 1: Install Git (One-Time Setup)

### Download and Install Git
1. Go to: https://git-scm.com/download/win
2. Download "64-bit Git for Windows Setup"
3. Run the installer
4. Use default settings (just keep clicking "Next")
5. **Important**: Check "Git from the command line and also from 3rd-party software"
6. Finish installation
7. **Restart your terminal/command prompt**

### Verify Installation
Open a new terminal and run:
```bash
git --version
```
You should see: `git version 2.x.x`

---

## Step 2: Create GitHub Account (If You Don't Have One)

1. Go to: https://github.com/signup
2. Sign up with your email
3. Verify your email
4. Choose the free plan

---

## Step 3: Create GitHub Repository

1. **Go to**: https://github.com/new
2. **Repository name**: `dmnstech-website` (or any name you like)
3. **Description**: "DMNS Tech - Practice Management Software Website"
4. **Visibility**: Public (or Private if you prefer)
5. **DO NOT** check "Add a README file"
6. **DO NOT** add .gitignore or license
7. Click **"Create repository"**

**Keep this page open** — you'll need the commands shown.

---

## Step 4: Push Your Code to GitHub

Open terminal in your project folder (`C:\Users\Ajay\Desktop\dmnstech`) and run these commands:

### Initialize Git
```bash
git init
```

### Configure Git (First Time Only)
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```
Replace with your actual name and email.

### Add All Files
```bash
git add .
```

### Commit
```bash
git commit -m "Initial commit - DMNS Tech website with all upgrades"
```

### Connect to GitHub
Replace `YOUR_USERNAME` and `REPO_NAME` with your actual GitHub username and repo name:
```bash
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git
git branch -M main
git push -u origin main
```

**Example**:
```bash
git remote add origin https://github.com/ajaysarvaiya/dmnstech-website.git
git branch -M main
git push -u origin main
```

You'll be prompted to login to GitHub. Use your GitHub credentials.

---

## Step 5: Connect Cloudflare Pages to GitHub

### 5.1 Go to Cloudflare
1. Visit: https://dash.cloudflare.com/
2. Sign up/login (free account)
3. Click **"Workers & Pages"** in the left sidebar
4. Click **"Create application"**
5. Click **"Pages"** tab
6. Click **"Connect to Git"**

### 5.2 Authorize GitHub
1. Click **"Connect GitHub"**
2. Authorize Cloudflare Pages
3. You may need to install Cloudflare Pages app on GitHub
4. Select **"All repositories"** or **"Only select repositories"**
5. If selecting specific repos, choose your `dmnstech-website` repo
6. Click **"Install & Authorize"**

### 5.3 Configure Deployment
1. **Select repository**: Choose `dmnstech-website` (or your repo name)
2. **Project name**: `dmnstech` (this will be your URL: `dmnstech.pages.dev`)
3. **Production branch**: `main`
4. **Build settings**:
   - Framework preset: **None**
   - Build command: **(leave empty)**
   - Build output directory: **/** (just a forward slash)
5. Click **"Save and Deploy"**

### 5.4 Wait for Deployment
- First deployment takes 30-60 seconds
- You'll see a progress bar
- Once done, you'll get your live URL: `https://dmnstech.pages.dev`

---

## Step 6: Test Your Live Site

1. Click the URL: `https://dmnstech.pages.dev`
2. Test everything:
   - [ ] All sections load
   - [ ] Animations work
   - [ ] Mobile menu works
   - [ ] Form validation works
   - [ ] WhatsApp buttons work
   - [ ] All links work

---

## Step 7: Set Up Custom Domain (Optional)

If you own a domain like `dmnstech.com`:

### In Cloudflare Pages:
1. Go to your project → **"Custom domains"**
2. Click **"Set up a custom domain"**
3. Enter your domain: `dmnstech.com`
4. Click **"Continue"**
5. Add another: `www.dmnstech.com`

### Update DNS:
If your domain is on Cloudflare:
- DNS records are auto-configured ✅

If your domain is elsewhere (GoDaddy, Namecheap, etc.):
1. Go to your domain registrar
2. Add these DNS records:
   ```
   Type: CNAME
   Name: @
   Target: dmnstech.pages.dev
   
   Type: CNAME
   Name: www
   Target: dmnstech.pages.dev
   ```
3. Wait 24-48 hours for DNS propagation

---

## ✅ You're Done! Auto-Deployment is Now Active

### How It Works:
Every time you make changes and push to GitHub, Cloudflare automatically deploys!

---

## Making Future Updates

### Method 1: Using Git Commands (Recommended)

```bash
# 1. Make changes to your files (edit index.html, etc.)

# 2. Check what changed
git status

# 3. Add all changes
git add .

# 4. Commit with a message
git commit -m "Updated hero section with new copy"

# 5. Push to GitHub
git push

# 6. Cloudflare auto-deploys in ~30 seconds!
```

### Method 2: Using GitHub Website

1. Go to your repo: `https://github.com/YOUR_USERNAME/dmnstech-website`
2. Click on `index.html`
3. Click the pencil icon (Edit)
4. Make your changes
5. Scroll down, add commit message
6. Click **"Commit changes"**
7. Cloudflare auto-deploys!

### Method 3: Using VS Code (If You Use It)

1. Open your project folder in VS Code
2. Make changes
3. Click Source Control icon (left sidebar)
4. Type commit message
5. Click ✓ (Commit)
6. Click "..." → Push
7. Done!

---

## Monitoring Deployments

### View Deployment Status:
1. Go to Cloudflare Dashboard → Workers & Pages
2. Click your project
3. See all deployments with status
4. Click any deployment to see logs

### Rollback if Needed:
1. Go to deployments list
2. Find a previous working version
3. Click "..." → "Rollback to this deployment"

---

## Troubleshooting

### Git Push Asks for Password
GitHub no longer accepts passwords. Use a Personal Access Token:

1. Go to: https://github.com/settings/tokens
2. Click **"Generate new token (classic)"**
3. Name: "Cloudflare Deployment"
4. Expiration: No expiration (or 1 year)
5. Check: **repo** (all repo permissions)
6. Click **"Generate token"**
7. **COPY THE TOKEN** (you won't see it again!)
8. When git asks for password, paste the token

### Deployment Failed
- Check Cloudflare Pages dashboard for error logs
- Ensure `index.html` is in the root directory
- Check build settings (should be empty)

### Changes Not Showing
- Wait 30-60 seconds for deployment
- Hard refresh browser: `Ctrl + Shift + R`
- Check deployment status in Cloudflare

---

## Quick Reference Commands

```bash
# Check status
git status

# Add all changes
git add .

# Commit
git commit -m "Your message here"

# Push to GitHub (triggers auto-deploy)
git push

# Pull latest changes (if working from multiple computers)
git pull

# View commit history
git log --oneline

# Undo last commit (before push)
git reset --soft HEAD~1
```

---

## What You Get

✅ **Live website**: `https://dmnstech.pages.dev`  
✅ **Auto-deployment**: Push to GitHub → Auto-deploys  
✅ **Version control**: Full history of all changes  
✅ **Rollback**: Revert to any previous version  
✅ **Preview deployments**: Test branches before merging  
✅ **Free SSL**: Automatic HTTPS  
✅ **Global CDN**: Fast worldwide  
✅ **Unlimited bandwidth**: No limits  
✅ **DDoS protection**: Built-in security  

---

## Next Steps After Deployment

1. **Set up form backend** (Formspree or Cloudflare Workers)
2. **Add analytics** (Cloudflare Web Analytics or Google Analytics)
3. **Generate favicons** and push to GitHub
4. **Create OG images** for social sharing
5. **Submit to Google Search Console**
6. **Test on real devices**

---

## Need Help?

If you get stuck at any step, let me know which step and what error you're seeing!

---

**Ready?** Start with Step 1 (Install Git) and work through each step. I'll help if you hit any issues!
