// DMNS Tech Website Configuration
// Update these values to customize your website

const SITE_CONFIG = {
  // Contact Information
  whatsappNumber: '918530416076',
  email: 'hello@dmnstech.com',
  
  // Form Submission
  // Option 1: Use Formspree (https://formspree.io)
  // Sign up and replace with your form endpoint
  formEndpoint: 'https://formspree.io/f/YOUR_FORM_ID',
  
  // Option 2: Use your own backend API
  // formEndpoint: 'https://api.dmnstech.com/submit-demo-request',
  
  // Option 3: Use Google Forms
  // formEndpoint: 'YOUR_GOOGLE_FORM_ACTION_URL',
  
  // Analytics
  // Google Analytics
  googleAnalyticsId: '', // e.g., 'G-XXXXXXXXXX'
  
  // Plausible Analytics (privacy-friendly alternative)
  plausibleDomain: '', // e.g., 'dmnstech.com'
  
  // Social Media
  social: {
    linkedin: '',
    twitter: '',
    facebook: ''
  },
  
  // SEO
  siteUrl: 'https://dmnstech.com',
  siteName: 'DMNS Tech',
  
  // Features
  enableFormSubmission: true,
  enableWhatsAppRedirect: true,
  enableAnalytics: false
};

// Export for use in main script
if (typeof module !== 'undefined' && module.exports) {
  module.exports = SITE_CONFIG;
}
