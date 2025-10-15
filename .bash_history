cat > cors.json <<'EOF'
[
  {
    "origin": [
      "http://localhost:3000",
      "http://127.0.0.1:3000",
      "https://studio-2410503780-807e6.web.app",
      "https://studio-2410503780-807e6.firebaseapp.com",
      "https://arkzknowledgehub.web.app",
      "https://arkzknowledgehub.firebaseapp.com"
    ],
    "method": ["GET", "PUT", "HEAD", "OPTIONS"],
    "responseHeader": ["Content-Type", "Authorization", "x-goog-meta-*"],
    "maxAgeSeconds": 3600
  }
]
EOF

gsutil cors set cors.json gs://studio-2410503780-807e6.firebasestorage.app
gsutil cors get gs://studio-2410503780-807e6.firebasestorage.app
firebase deploy --only functions:getSignedUploadUrl
cat > cors.json <<'EOF'
[
  {
    "origin": [
      "https://studio-2410503780-807e6.web.app",
      "https://studio-2410503780-807e6.firebaseapp.com",
      "https://arkknowledgehub.web.app",
      "https://arkknowledgehub.firebaseapp.com",
      "http://localhost:3000",
      "http://127.0.0.1:3000",
      "https://studio.firebase.google.com"
    ],
    "method": ["GET","PUT","HEAD","POST","OPTIONS"],
    "responseHeader": ["Content-Type","Authorization","x-goog-meta-*"],
    "maxAgeSeconds": 3600
  }
]
EOF

gsutil cors set cors.json gs://studio-2410503780-807e6.firebasestorage.app
gsutil cors get gs://studio-2410503780-807e6.firebasestorage.app
cat > cors.json <<'EOF'
[
  {
    "origin": [
      "https://studio.firebase.google.com",
      "https://studio-2410503780-807e6.web.app",
      "https://studio-2410503780-807e6.firebaseapp.com",
      "https://arkknowledgehub.web.app",
      "https://arkknowledgehub.firebaseapp.com",
      "http://localhost:3000",
      "http://127.0.0.1:3000",
      "https://6000-firebase-studio-1759764674780.cluster-lu4mup4g7g5gm4rtyvhzpwbfadci.cloudworkstations.dev"
    ],
    "method": ["GET", "PUT", "HEAD", "POST", "OPTIONS"],
    "responseHeader": ["Content-Type", "Authorization", "x-goog-meta-*"],
    "maxAgeSeconds": 3600
  }
]
EOF

gsutil cors set cors.json gs://studio-2410503780-807e6.firebasestorage.app
gsutil cors get gs://studio-2410503780-807e6.firebasestorage.app
export BUCKET=gs://studio-2410503780-807e6.firebasestorage.app
cat > cors-open.json <<'EOF'
[
  {
    "origin": ["*"],
    "method": ["GET", "PUT", "POST", "HEAD", "OPTIONS"],
    "responseHeader": [
      "Content-Type",
      "Authorization",
      "x-goog-*",
      "x-firebase-appcheck"
    ],
    "maxAgeSeconds": 3600
  }
]
EOF

gsutil cors set cors-open.json $BUCKET
gsutil cors get $BUCKET
# Make a tiny fake image file
echo "ok" > /tmp/test.jpg
# Paste your full signed URL between the quotes:
curl -i -X PUT   -H "Content-Type: image/jpeg"   --upload-file /tmp/test.jpg   "https://storage.googleapis.com/studio-2410503780-807e6.firebasestorage.app/organizations/VARNXduckZkbIyFjXTw9/drafts/bff07546-d81a-4d04-a0df-ccaf0822d74b/1760524303633-WhatsApp_Image_2025-10-06_at_23.53.48_7074d3f6.jpg?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=63654890665-compute%40developer.gserviceaccount.com%2F20251015%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20251015T103143Z&X-Goog-Expires=600&X-Goog-SignedHeaders=content-type%3Bhost&X-Goog-Signature=3b8dd2b6447e168b603df1627f87ca5e68a6d98ffa626bb5794b6709e0b82644ae807957b2707776b92a9b78951e88bb75419c9b7c228bfc253069aa59262dc7f3009fe2c4fc87398757f914148572321ce2ab2949c0168e46c99b5b52c00fa014852df9e943c2a9180c6e5b44a188eccdcc20f5865b9840909532acd62919c56c6b5418e255bca2f681bc8a976a2c3cd8f2bf4eed581b458aa819bf200816ce5bb08ff0dbdf1349df9d94cb1441f7d16a20fec14b7c8b1df7ca0328570e6270809ef06590b9cd01b461a4f761264c859c519984b2bc83fff88e0f528bf2d821193793619c51cf9e8a0e25995e1f08fcbb141044b5d5b6dab6a969d5cff475ef"
# 2.1) Set your bucket name (copy the whole line)
export BUCKET="studio-2410503780-807e6.firebasestorage.app"
# 2.2) Create CORS policy file (copy everything including JSON block)
cat > cors.json <<'JSON'
[
  {
    "origin": [
      "https://arkzknowledgehub.web.app",
      "https://arkzknowledgehub.firebaseapp.com",
      "http://localhost:3000",
      "http://127.0.0.1:3000"
    ],
    "method": ["PUT","OPTIONS","GET"],
    "responseHeader": ["Content-Type","x-goog-resumable"],
    "maxAgeSeconds": 3600
  }
]
JSON

# 2.3) Apply CORS to your Firebase Storage bucket
gsutil cors set cors.json gs://$BUCKET
# 2.4) Verify it took effect (you should see the same JSON back)
gsutil cors get gs://$BUCKET
git init
git add .
git commit -m "Initial commit"
git config --global user.email "ezekielzechariahlove@gmail.com"
git config --global user.name "Ezekiel Zechariah Love"
