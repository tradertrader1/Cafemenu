CAFE QR DIGITAL MENU — QUICK START

Files:
- index.html: complete website

Run locally:
1. Extract the ZIP.
2. Open index.html in Chrome, Edge, or another modern browser.
3. Open Admin and sign in:
   Username: admin
   Password: cafe123
4. Add/edit/delete menu items, set prices in ETB, and update cafe details.
5. Change the admin password in the Admin dashboard.

Publish on GitHub Pages:
1. Create a GitHub repository.
2. Upload index.html (and this README if desired) to the repository root.
3. In Settings > Pages, enable deployment from the main branch and root folder.
4. Open the published website URL, sign in as admin, and generate/download the QR code.

IMPORTANT LOCALSTORAGE LIMITATION:
This version stores the menu in the browser's LocalStorage. LocalStorage belongs to one browser/device. If you publish the website on GitHub Pages, menu edits made in the admin's browser will NOT automatically appear on customers' phones. The QR code can open the website, but shared live menu updates across devices require a cloud database/backend. This version follows your selected LocalStorage setup.

QR CODE:
The QR code is generated from the hosted website URL using an online QR image service. Internet access is needed to display/download the QR code. Customers can scan it with their phone camera.

SECURITY:
This is a simple browser-only demo admin login, not secure authentication. Do not use it to protect confidential information.


Latest update:
- Fixed category buttons using safe data attributes and delegated click handling. Selecting a category now filters items by normalized category name; All shows every item.
- Added picture review/editor: upload or load an image URL, preview it, drag to select a crop area, zoom, rotate left/right, reset, and apply the edited image before saving the menu item.
- No image file-size validation is imposed by the app. Browser LocalStorage still has a practical storage quota, so very large images may exceed the browser's available space.
