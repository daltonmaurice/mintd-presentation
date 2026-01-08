# GitHub Pages Deployment Guide

This presentation series is configured to automatically deploy to GitHub Pages using GitHub Actions.

## 🚀 Quick Setup

### 1. Push to GitHub

If you haven't already set up a GitHub repository:

```bash
# Initialize git (if not already done)
git init
git add .
git commit -m "Initial commit: Mint presentation series"

# Create a new repository on GitHub, then:
git remote add origin git@github.com:YOUR-ORG/mint-presentation.git
git branch -M main
git push -u origin main
```

### 2. Enable GitHub Pages

1. Go to your repository on GitHub
2. Navigate to **Settings** → **Pages**
3. Under **Source**, select:
   - Source: **GitHub Actions** (not "Deploy from a branch")
4. Save the settings

### 3. Trigger Deployment

The workflow will automatically run when you push to the `main` branch. You can also manually trigger it:

1. Go to **Actions** tab in your repository
2. Select **Deploy Presentation Slides** workflow
3. Click **Run workflow** → **Run workflow**

### 4. Access Your Slides

After the workflow completes (usually 2-3 minutes), your slides will be available at:

```
https://YOUR-ORG.github.io/mint-presentation/
```

The landing page will link to all three sessions:
- Session 1: Concepts & Motivation
- Session 2: Using the Framework with Stata
- Session 3: Advanced Topics & Adoption

---

## 📁 What Gets Deployed

The GitHub Actions workflow:

1. ✅ Installs Quarto
2. ✅ Renders all three `.qmd` files to HTML
3. ✅ Copies HTML files and assets to `public/` directory
4. ✅ Deploys to GitHub Pages

**Files deployed:**
- `index.html` - Landing page with links to sessions
- `session1-concepts.html` - Session 1 presentation
- `session2-usage.html` - Session 2 presentation
- `session3-advanced.html` - Session 3 presentation
- `*_files/` - RevealJS assets (CSS, JS, images)
- `custom.scss` - Custom styling

---

## 🔄 Updating Presentations

To update the presentations:

1. Edit the `.qmd` source files locally
2. Commit and push your changes:
   ```bash
   git add session*.qmd
   git commit -m "Update presentation content"
   git push
   ```
3. GitHub Actions will automatically rebuild and redeploy

---

## 🧪 Local Testing

Before pushing, test your changes locally:

```bash
# Render a single presentation
quarto render session1-concepts.qmd

# Preview with live reload
quarto preview session1-concepts.qmd

# Render all presentations
quarto render session1-concepts.qmd
quarto render session2-usage.qmd
quarto render session3-advanced.qmd

# Open the landing page
open index.html
```

---

## 🛠️ Workflow Configuration

The deployment workflow is defined in `.github/workflows/deploy-slides.yml`:

**Triggers:**
- Push to `main` branch
- Manual trigger via GitHub Actions UI

**Permissions:**
- `contents: read` - Read repository contents
- `pages: write` - Deploy to GitHub Pages
- `id-token: write` - OIDC token for deployment

**Jobs:**
1. **Build** - Render Quarto presentations and prepare artifacts
2. **Deploy** - Deploy to GitHub Pages using official action

---

## 🎨 Customizing the Landing Page

Edit `index.html` to customize:

- **Colors:** Modify the gradient in `background: linear-gradient(...)`
- **Session details:** Update session titles, descriptions, durations
- **Footer links:** Add your organization's links
- **Styling:** Modify the `<style>` section

After editing, commit and push to see changes live.

---

## 🔒 Private Repositories

If your repository is private:

1. GitHub Pages will still work with GitHub Pro/Team/Enterprise
2. Or make only the `gh-pages` branch public (advanced)
3. Or use alternative deployment (Netlify, Vercel)

For private repositories on free plans, consider:
- Making the repository public
- Using organization-level GitHub Pages
- Self-hosting on your own server

---

## 🐛 Troubleshooting

### Workflow fails on first run

**Solution:** Ensure GitHub Pages is set to "GitHub Actions" source (not "Deploy from a branch").

### Pages not updating

**Solutions:**
1. Check Actions tab for workflow errors
2. Clear browser cache (Cmd/Ctrl + Shift + R)
3. Wait a few minutes - CDN propagation can take time
4. Verify Pages is enabled: Settings → Pages

### Quarto render errors

**Solutions:**
1. Check `.qmd` file syntax
2. Ensure all referenced files exist
3. Test locally: `quarto render session1-concepts.qmd`
4. Check workflow logs in Actions tab

### 404 errors on deployed site

**Solutions:**
1. Verify all HTML files are in `public/` directory
2. Check that `index.html` exists
3. Ensure file paths are relative (not absolute)
4. Check browser console for errors

---

## 📊 Monitoring Deployments

### View Deployment Status

1. **Actions Tab:** See workflow runs and logs
2. **Deployments:** Settings → Pages shows deployment history
3. **Environment:** Repository → Environments → github-pages

### Deployment URL

The deployment URL is shown in:
- Workflow run summary (after deploy job completes)
- Settings → Pages
- Repository main page (if configured)

---

## 🚀 Alternative Deployment Options

### Netlify

```bash
# Install Netlify CLI
npm install -g netlify-cli

# Build locally
quarto render

# Deploy
netlify deploy --dir=public --prod
```

### Vercel

```bash
# Install Vercel CLI
npm install -g vercel

# Build locally
quarto render

# Deploy
vercel --prod
```

### Self-Hosted

```bash
# Build locally
quarto render

# Copy to web server
rsync -avz public/ user@server:/var/www/html/presentations/
```

---

## 📝 Notes

- **Build time:** ~2-3 minutes per deployment
- **Concurrent deployments:** Only one deployment runs at a time (prevents conflicts)
- **Branch protection:** Consider protecting `main` branch to require PR reviews
- **Cost:** GitHub Pages is free for public repositories

---

## ✅ Checklist

Before going live:

- [ ] All presentations render without errors locally
- [ ] `index.html` links are correct
- [ ] GitHub repository is created
- [ ] GitHub Pages is enabled (Source: GitHub Actions)
- [ ] Workflow has run successfully
- [ ] Site is accessible at GitHub Pages URL
- [ ] All links work on deployed site
- [ ] Presentation keyboard controls work (arrow keys, F for fullscreen, S for speaker notes)
- [ ] Mobile view looks good

---

## 🔗 Resources

- [Quarto Documentation](https://quarto.org/docs/presentations/revealjs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [RevealJS Documentation](https://revealjs.com/)

---

**Last Updated:** January 8, 2026
