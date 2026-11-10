CAFE QR DIGITAL MENU — SUPABASE + GITHUB PAGES

WHAT THIS VERSION DOES
- Stores the cafe menu in a shared Supabase database.
- Public customers can read the same menu from any phone or computer.
- Signed-in Supabase admins can add, edit, delete menu items and change cafe details.
- Existing category filtering and picture editor are retained.
- Menu is fetched from Supabase whenever the page is opened/refreshed.
- Admin login uses Supabase email/password authentication (not the old demo admin/cafe123 login).

IMPORTANT FILES
- index.html: website. Add your Supabase URL and anon/public key in the marked section near the beginning of its JavaScript.
- SUPABASE_SETUP.sql: create the table and security policies. Run this in Supabase SQL Editor.

SET UP SUPABASE
1. Go to https://supabase.com and sign in or create a free project.
2. Create a new project and wait for it to finish provisioning.
3. Open SQL Editor in the Supabase project.
4. Open SUPABASE_SETUP.sql from this ZIP, copy all its contents, paste into a new SQL query, and click Run.
5. Open Project Settings > API (or API Keys, depending on the dashboard layout).
6. Copy the Project URL and the anon/public key. The key may be labelled publishable/anon public.
7. Open index.html in a text editor such as Notepad.
8. Find these two lines near the start of the JavaScript:
   const SUPABASE_URL='YOUR_SUPABASE_PROJECT_URL';
   const SUPABASE_ANON_KEY='YOUR_SUPABASE_ANON_PUBLIC_KEY';
9. Replace the placeholder text with your own Project URL and anon/public key. Keep the single quotation marks.
   Example format only (do not use these example values):
   const SUPABASE_URL='https://abcdefgh.supabase.co';
   const SUPABASE_ANON_KEY='eyJ...your-public-key...';
10. Save index.html.

CREATE YOUR ADMIN LOGIN
1. In Supabase, open Authentication > Users.
2. Choose Add user / Create new user.
3. Enter the admin email and set a strong password.
4. Create the user. Use this exact email and password in the website's Admin sign-in screen.
5. Do not enable public sign-ups for this single-admin menu unless you specifically need them. Create admin users yourself in the Supabase dashboard.

PUBLISH TO GITHUB PAGES
1. Extract the ZIP.
2. Upload index.html and SUPABASE_SETUP.sql to your GitHub repository root (the SQL file is for your reference; it does not need to be public on the website).
3. Replace the old index.html in GitHub with the edited one.
4. Wait for GitHub Pages to redeploy, then open the public site.
5. Open Admin, sign in using your Supabase admin email/password.
6. If this is your first time and the database table is empty, the menu data already saved in this browser will be uploaded as the initial menu. If there is already a menu row in Supabase, that shared menu will be loaded instead.
7. Add or edit a menu item and confirm the database status says it is saved to Supabase.
8. Open the public site on another phone (or refresh it) to see the shared menu.

SECURITY NOTES
- The anon/public key is designed to be used in browser code. It is safe to publish when Row Level Security (RLS) is enabled as in the supplied SQL.
- NEVER put the Supabase service_role/secret key in index.html or GitHub.
- The supplied policies allow anyone to read the menu, but only authenticated Supabase users can insert/update it.
- Anyone you create as a Supabase Auth user will have admin write access under these policies. Only create trusted admin accounts.
- The old localStorage demo password is no longer used for admin sign-in.

IMAGES AND STORAGE
This version keeps each image URL or edited image data inside the menu record, as the previous version did. Large uploaded/cropped images can make the database record large and may run into browser memory or request limits. For a large menu or many high-resolution images, the next improvement is to upload pictures to a Supabase Storage bucket and keep only their public URLs in the menu table.

TROUBLESHOOTING
- "Supabase is not configured": check that the URL and anon/public key were pasted into index.html correctly, then upload the updated file to GitHub.
- "Invalid API key" or network errors: check the Project URL and anon/public key belong to the same Supabase project.
- "relation cafe_menu does not exist": run SUPABASE_SETUP.sql in the SQL Editor.
- "permission denied" or RLS errors: run SUPABASE_SETUP.sql again and confirm the signed-in admin user exists under Authentication > Users.
- Customer sees old menu: refresh the GitHub Pages website after the admin saves. The page loads the latest shared record on each visit/refresh.
