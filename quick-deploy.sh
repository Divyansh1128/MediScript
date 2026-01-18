#!/bin/bash

echo "🚀 Quick Deployment to Vercel"
echo "=============================="
echo ""

# Step 1: Commit changes
echo "📝 Step 1: Committing deployment files..."
git add .env.example vercel.json DEPLOYMENT.md deploy.sh quick-deploy.sh
git commit -m "Add deployment configuration files"

# Step 2: Push to GitHub
echo "📤 Step 2: Pushing to GitHub..."
git push origin main

# Step 3: Instructions
echo ""
echo "✅ Files pushed to GitHub!"
echo ""
echo "🌐 Next: Deploy to Vercel"
echo "=========================="
echo ""
echo "Option 1: Vercel Dashboard (Easiest)"
echo "-------------------------------------"
echo "1. Visit: https://vercel.com/new"
echo "2. Click 'Import Git Repository'"
echo "3. Select your GitHub repository: Divyansh1128/MediScript"
echo "4. Click 'Import'"
echo ""
echo "5. Add Environment Variables (click 'Add' for each):"
echo "   Required:"
echo "   - MONGODB_URI (your MongoDB connection string)"
echo "   - NEXTAUTH_SECRET (generate: openssl rand -base64 32)"
echo "   - NEXTAUTH_URL (use: https://your-app-name.vercel.app)"
echo ""
echo "   Optional (add if you're using these services):"
echo "   - GOOGLE_CLIENT_ID"
echo "   - GOOGLE_CLIENT_SECRET"
echo "   - UPSTASH_REDIS_REST_URL"
echo "   - UPSTASH_REDIS_REST_TOKEN"
echo "   - RESEND_API_KEY"
echo ""
echo "6. Click 'Deploy'"
echo "7. Wait 2-3 minutes"
echo "8. Your app will be live! 🎉"
echo ""
echo "Option 2: Vercel CLI"
echo "--------------------"
echo "npm i -g vercel"
echo "vercel login"
echo "vercel"
echo "vercel --prod"
echo ""
echo "📖 For detailed instructions, see: DEPLOYMENT.md"
