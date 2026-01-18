#!/bin/bash

echo "🚀 MediScript Deployment Script"
echo "================================"
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "❌ Git repository not initialized"
    echo "Run: git init"
    exit 1
fi

# Check if remote is set
if ! git remote | grep -q "origin"; then
    echo "⚠️  No git remote found"
    echo "Add remote: git remote add origin https://github.com/YOUR_USERNAME/MediScript.git"
else
    echo "✅ Git remote configured"
fi

# Check for node_modules
if [ ! -d node_modules ]; then
    echo "📦 Installing dependencies..."
    npm install
else
    echo "✅ Dependencies installed"
fi

# Test build
echo ""
echo "🔨 Testing build..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
else
    echo "❌ Build failed. Fix errors before deploying."
    exit 1
fi

echo ""
echo "✅ Project is ready for deployment!"
echo ""
echo "Next steps:"
echo "1. Create a repository on GitHub"
echo "2. Push your code:"
echo "   git add ."
echo "   git commit -m 'Ready for deployment'"
echo "   git push -u origin main"
echo ""
echo "3. Deploy to Vercel:"
echo "   - Visit https://vercel.com/new"
echo "   - Import your GitHub repository"
echo "   - Add environment variables from .env.example"
echo "   - Click Deploy!"
echo ""
echo "📖 See DEPLOYMENT.md for detailed instructions"
