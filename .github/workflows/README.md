# GitHub Actions Setup

## Required Secrets

To enable the automated deployment of resume files to the salish.dev repository, you need to configure the following secret:

### SALISH_DEV_TOKEN

1. Go to GitHub Settings > Developer settings > Personal access tokens > Tokens (classic)
2. Generate a new token with the following permissions:
   - `repo` (full control of private repositories)
3. Copy the generated token
4. In the astere/resume repository:
   - Go to Settings > Secrets and variables > Actions
   - Click "New repository secret"
   - Name: `SALISH_DEV_TOKEN`
   - Value: Paste the token you generated
   - Click "Add secret"

## Workflow Behavior

The `deploy-resume.yml` workflow will:
1. Trigger on pushes to the main branch or manual dispatch
2. Build the resume using Docker
3. Push `resume.json` and `resume.pdf` to the `public/` directory in salishdev/salish.dev
4. Commit changes as github-actions[bot]