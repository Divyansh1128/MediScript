# Deployment Guide - MediScript

## 🚀 Quick Deploy to Vercel

### Prerequisites
1. GitHub account
2. Vercel account (sign up at https://vercel.com)
3. MongoDB Atlas account (or MongoDB instance)
4. Required API keys (Google OAuth, Resend, etc.)

---

## Step-by-Step Deployment

### 1. **Prepare Your Repository**

```bash
# Initialize git if not already done
git init

# Add all files
git add .

# Commit your changes
git commit -m "Initial commit - Ready for deployment"

# Create a new repository on GitHub and push
git remote add origin https://github.com/YOUR_USERNAME/MediScript.git
git branch -M main
git push -u origin main
```

---

### 2. **Set Up MongoDB Atlas** (if not already done)

1. Go to https://www.mongodb.com/cloud/atlas
2. Create a free cluster
3. Click "Connect" → "Connect your application"
4. Copy the connection string (looks like: `mongodb+srv://username:password@cluster.mongodb.net/`)
5. Replace `<password>` with your actual password
6. Add your database name at the end: `mongodb+srv://username:password@cluster.mongodb.net/doc-prescrip`

---

### 3. **Deploy to Vercel**

#### Option A: Using Vercel Dashboard (Easiest)

1. Go to https://vercel.com/new
2. Import your GitHub repository
3. Click "Import" next to your MediScript repository
4. Configure your project:
   - **Framework Preset**: Next.js (auto-detected)
   - **Root Directory**: `./`
   - **Build Command**: `npm run build` (auto-detected)
   - **Output Directory**: `.next` (auto-detected)

5. **Add Environment Variables** (Click "Environment Variables"):

```
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/doc-prescrip
MONGODB_DB_NAME=doc-prescrip
NEXTAUTH_SECRET=your-generated-secret-key
NEXTAUTH_URL=https://your-app-name.vercel.app
GOOGLE_CLIENT_ID=your-google-client-id
GOOGLE_CLIENT_SECRET=your-google-client-secret
UPSTASH_REDIS_REST_URL=your-upstash-url
UPSTASH_REDIS_REST_TOKEN=your-upstash-token
RESEND_API_KEY=your-resend-api-key
```

6. Click **"Deploy"**

#### Option B: Using Vercel CLI

```bash
# Install Vercel CLI
npm i -g vercel

# Login to Vercel
vercel login

# Deploy
vercel

# Follow the prompts:
# - Set up and deploy? Yes
# - Which scope? Select your account
# - Link to existing project? No
# - What's your project's name? mediscript
# - In which directory is your code located? ./
# - Want to override settings? No

# Add environment variables
vercel env add MONGODB_URI
vercel env add NEXTAUTH_SECRET
# ... add all other environment variables

# Deploy to production
vercel --prod
```

---

### 4. **Generate Required Secrets**

#### Generate NEXTAUTH_SECRET:
```bash
# Option 1: Using OpenSSL
openssl rand -base64 32

# Option 2: Using Node.js
node -e "console.log(require('crypto').randomBytes(32).toString('base64'))"

# Option 3: Online
# Visit: https://generate-secret.vercel.app/32
```

---

### 5. **Configure Google OAuth** (Optional)

1. Go to https://console.cloud.google.com/
2. Create a new project or select existing
3. Enable Google+ API
4. Go to "Credentials" → "Create Credentials" → "OAuth client ID"
5. Application type: Web application
6. Authorized JavaScript origins: `https://your-app.vercel.app`
7. Authorized redirect URIs: `https://your-app.vercel.app/api/auth/callback/google`
8. Copy Client ID and Client Secret
9. Add them to Vercel environment variables

---

### 6. **Configure Upstash Redis** (Optional)

1. Go to https://upstash.com/
2. Create a new Redis database
3. Copy the REST URL and Token
4. Add them to Vercel environment variables

---

### 7. **Configure Resend Email** (Optional)

1. Go to https://resend.com/
2. Create an API key
3. Add it to Vercel environment variables

---

### 8. **Post-Deployment Steps**

1. **Update NEXTAUTH_URL** in Vercel:
   - Go to your project settings
   - Update `NEXTAUTH_URL` to your actual Vercel URL: `https://your-app.vercel.app`

2. **Update Google OAuth redirect URIs** (if using):
   - Add your production URL to authorized origins and redirect URIs

3. **Configure Custom Domain** (Optional):
   - Go to your Vercel project → Settings → Domains
   - Add your custom domain (e.g., `doc-prescrip.com`)
   - Follow DNS configuration instructions

4. **Test Your Deployment**:
   - Visit your deployed URL
   - Test login functionality
   - Create a test patient
   - Generate a prescription
   - Check all features work correctly

---

## 🔧 Troubleshooting

### Build Fails
- Check build logs in Vercel dashboard
- Ensure all dependencies are in `package.json`
- Test build locally: `npm run build`

### Database Connection Issues
- Verify MongoDB URI is correct
- Check MongoDB Atlas network access (allow 0.0.0.0/0 for Vercel)
- Ensure database user has read/write permissions

### Authentication Issues
- Verify NEXTAUTH_URL matches your deployment URL
- Check NEXTAUTH_SECRET is set
- Ensure Google OAuth redirect URIs are correct

### Environment Variables Not Working
- Redeploy after adding environment variables
- Check variable names match exactly (case-sensitive)
- Ensure no trailing spaces in values

---

## 📊 Monitoring

- **Vercel Analytics**: Automatically enabled
- **Error Tracking**: Check Vercel deployment logs
- **Performance**: Use Vercel Speed Insights

---

## 🔄 Continuous Deployment

Once set up, every push to your `main` branch will automatically deploy to production!

```bash
# Make changes
git add .
git commit -m "Update feature"
git push origin main

# Vercel automatically deploys!
```

---

## 🌐 Alternative Deployment Options

### Deploy to Netlify
```bash
npm i -g netlify-cli
netlify login
netlify init
netlify deploy --prod
```

### Deploy to Railway
1. Visit https://railway.app
2. Connect GitHub repository
3. Add environment variables
4. Deploy

### Deploy to DigitalOcean App Platform
1. Visit https://cloud.digitalocean.com/apps
2. Create new app from GitHub
3. Configure build settings
4. Add environment variables
5. Deploy

---

## 📝 Notes

- First deployment may take 2-5 minutes
- Subsequent deployments are faster (1-2 minutes)
- Free tier includes 100GB bandwidth
- Custom domains require DNS configuration
- SSL certificates are automatic with Vercel

---

## ✅ Deployment Checklist

- [ ] Repository pushed to GitHub
- [ ] MongoDB Atlas cluster created
- [ ] Environment variables prepared
- [ ] Vercel project created
- [ ] All environment variables added
- [ ] First deployment successful
- [ ] Custom domain configured (optional)
- [ ] Google OAuth configured (optional)
- [ ] Test all features in production
- [ ] Update README with production URL

---

For support: https://vercel.com/support
