# Deployment Guide for DMNS Tech Website

## Pre-Deployment Checklist

Before deploying your website, ensure you've completed these steps:

### 1. Configuration
- [ ] Update WhatsApp number in `config.js`
- [ ] Update email address in `config.js`
- [ ] Configure form submission endpoint
- [ ] Add analytics tracking ID (if using)
- [ ] Update social media links (if applicable)

### 2. Content Review
- [ ] Verify all text content is accurate
- [ ] Check all links work correctly
- [ ] Test contact form functionality
- [ ] Verify WhatsApp link opens correctly
- [ ] Review product descriptions

### 3. Assets
- [ ] Generate and add favicon files
- [ ] Add Open Graph image (og-image.jpg)
- [ ] Add Twitter Card image (twitter-image.jpg)
- [ ] Optimize all images for web

### 4. SEO
- [ ] Update meta descriptions
- [ ] Verify sitemap.xml has correct URLs
- [ ] Update robots.txt with correct domain
- [ ] Test structured data (if added)

### 5. Testing
- [ ] Test on mobile devices
- [ ] Test on different browsers
- [ ] Run Lighthouse audit
- [ ] Check accessibility with WAVE
- [ ] Test form submission
- [ ] Verify all animations work

## Deployment Options

### Option 1: Netlify (Recommended for Beginners)

**Pros:** Free, automatic HTTPS, continuous deployment, form handling
**Cons:** None for this use case

**Steps:**
1. Create account at [netlify.com](https://netlify.com)
2. Drag and drop your project folder
3. Or connect GitHub repository for auto-deployment
4. Configure custom domain (optional)
5. Enable form notifications in Netlify dashboard

**Netlify Form Setup:**
Update your form in `index.html`:
```html
<form name="demo-request" method="POST" data-netlify="true">
  <input type="hidden" name="form-name" value="demo-request">
  <!-- rest of form fields -->
</form>
```

### Option 2: Vercel

**Pros:** Fast, free, excellent performance, easy GitHub integration
**Cons:** None for this use case

**Steps:**
1. Install Vercel CLI: `npm i -g vercel`
2. Run `vercel` in project directory
3. Follow prompts
4. Or connect GitHub repo at [vercel.com](https://vercel.com)

### Option 3: GitHub Pages

**Pros:** Free, simple, integrated with GitHub
**Cons:** No server-side processing, need external form service

**Steps:**
1. Create GitHub repository
2. Push your code:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/username/repo.git
   git push -u origin main
   ```
3. Go to Settings > Pages
4. Select main branch
5. Save and wait for deployment

**Custom Domain:**
1. Add CNAME file with your domain
2. Configure DNS records at your domain provider

### Option 4: Traditional Web Hosting

**Pros:** Full control, can use existing hosting
**Cons:** Manual updates, need to configure HTTPS

**Steps:**
1. Connect via FTP/SFTP
2. Upload all files to public_html or www directory
3. Ensure index.html is in root
4. Configure SSL certificate
5. Test the site

**Recommended Hosts:**
- Hostinger
- SiteGround
- Bluehost
- DigitalOcean (for developers)

## Post-Deployment Tasks

### 1. Domain Configuration
If using custom domain:
- Configure DNS A records or CNAME
- Wait for DNS propagation (up to 48 hours)
- Enable HTTPS/SSL
- Test www and non-www versions

### 2. Form Setup
Choose one:

**A. Formspree**
1. Sign up at [formspree.io](https://formspree.io)
2. Create form
3. Update endpoint in `index.html`
4. Test submission

**B. Netlify Forms**
1. Already configured if using Netlify
2. Check form submissions in Netlify dashboard
3. Set up email notifications

**C. Custom Backend**
1. Deploy your API
2. Update CORS settings
3. Test endpoint
4. Update form endpoint in code

### 3. Analytics Setup

**Google Analytics:**
```html
<!-- Add before </head> -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

**Plausible (Privacy-friendly):**
```html
<!-- Add before </head> -->
<script defer data-domain="dmnstech.com" src="https://plausible.io/js/script.js"></script>
```

### 4. Search Console Setup
1. Go to [Google Search Console](https://search.google.com/search-console)
2. Add your property
3. Verify ownership (HTML file or DNS)
4. Submit sitemap.xml
5. Monitor indexing status

### 5. Performance Optimization

**Enable Compression:**
Most modern hosts enable this by default. If not, add to `.htaccess`:
```apache
<IfModule mod_deflate.c>
  AddOutputFilterByType DEFLATE text/html text/plain text/xml text/css text/javascript application/javascript
</IfModule>
```

**Browser Caching:**
Add to `.htaccess`:
```apache
<IfModule mod_expires.c>
  ExpiresActive On
  ExpiresByType image/jpg "access plus 1 year"
  ExpiresByType image/jpeg "access plus 1 year"
  ExpiresByType image/gif "access plus 1 year"
  ExpiresByType image/png "access plus 1 year"
  ExpiresByType text/css "access plus 1 month"
  ExpiresByType application/javascript "access plus 1 month"
</IfModule>
```

### 6. Security Headers
Add to `.htaccess` or configure in hosting panel:
```apache
<IfModule mod_headers.c>
  Header set X-Content-Type-Options "nosniff"
  Header set X-Frame-Options "SAMEORIGIN"
  Header set X-XSS-Protection "1; mode=block"
  Header set Referrer-Policy "strict-origin-when-cross-origin"
</IfModule>
```

## Monitoring & Maintenance

### Weekly
- [ ] Check form submissions
- [ ] Review analytics data
- [ ] Test website functionality

### Monthly
- [ ] Review and respond to inquiries
- [ ] Update content if needed
- [ ] Check for broken links
- [ ] Review performance metrics

### Quarterly
- [ ] Update product information
- [ ] Refresh testimonials/case studies
- [ ] Review and update SEO strategy
- [ ] Analyze conversion rates

## Troubleshooting

### Form Not Submitting
1. Check browser console for errors
2. Verify form endpoint is correct
3. Check CORS settings if using custom backend
4. Test with different browsers

### Images Not Loading
1. Verify file paths are correct
2. Check file names match exactly (case-sensitive)
3. Ensure images are uploaded to server

### Slow Loading
1. Run Lighthouse audit
2. Optimize images (use WebP format)
3. Enable compression
4. Use CDN for assets

### Mobile Issues
1. Test on real devices
2. Check viewport meta tag
3. Verify touch targets are large enough
4. Test on different screen sizes

## Backup Strategy

### Automated Backups
- GitHub: Automatic version control
- Netlify/Vercel: Automatic deployment history
- Traditional hosting: Enable automatic backups

### Manual Backups
1. Download all files monthly
2. Export form submissions
3. Save analytics reports
4. Document configuration changes

## Support Resources

- **Netlify Docs:** https://docs.netlify.com
- **Vercel Docs:** https://vercel.com/docs
- **GitHub Pages:** https://pages.github.com
- **Formspree Docs:** https://help.formspree.io

## Emergency Contacts

Keep these handy:
- Domain registrar support
- Hosting provider support
- DNS provider support
- Email provider support

---

**Last Updated:** April 19, 2026
**Version:** 1.0
