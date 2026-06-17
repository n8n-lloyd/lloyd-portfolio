#!/bin/bash
# ─────────────────────────────────────────────────────────────────
#  LLOYD PORTFOLIO — PUSH TO GITHUB (June 2026 update)
#  Files: index.html + koruna-booking-engine.html
# ─────────────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
echo ""
echo "══════════════════════════════════════════════"
echo "  Lloyd Portfolio → GitHub Push"
echo "══════════════════════════════════════════════"
echo ""
if [ -z "$GH_TOKEN" ]; then
  echo -n "  GitHub Personal Access Token: "
  read -s GH_TOKEN; echo ""
fi
[ -z "$GH_TOKEN" ] && echo "  ✗ No token. Exiting." && exit 1

WORK_DIR="/tmp/lloyd-portfolio-push"
rm -rf "$WORK_DIR"
git clone "https://n8n-lloyd:${GH_TOKEN}@github.com/n8n-lloyd/lloyd-portfolio.git" "$WORK_DIR" --quiet
cd "$WORK_DIR"
git config user.email "primo3746@gmail.com"
git config user.name "Lloyd Lisen"

cp "$SCRIPT_DIR/index.html" "$WORK_DIR/index.html"
cp "$SCRIPT_DIR/koruna-booking-engine.html" "$WORK_DIR/koruna-booking-engine.html"

git add index.html koruna-booking-engine.html
git commit -m "Add Project 07: Koruna Assist Booking Engine + portfolio refresh June 2026

- PROJECT 07 (FEATURED): Conversational AI Booking Engine card with 7-step flow
- koruna-booking-engine.html: full SOP presentation with ← Portfolio link
- Hero chips updated: Conversational AI, Koruna Assist, Higgsfield/Claude Code
- About + Timeline: Koruna Assist AI Specialist (May 2026 - Present)
- New Conversational AI skill card added to skills grid"

git push "https://n8n-lloyd:${GH_TOKEN}@github.com/n8n-lloyd/lloyd-portfolio.git" main --quiet
echo ""
echo "  ✅  PUSHED! Vercel will auto-deploy in ~30 seconds."
echo "  🌐  https://lloyd-portfolio-three.vercel.app"
echo ""
unset GH_TOKEN
