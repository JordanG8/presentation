# GitHub Actions Auto-Deployment Setup

This is a much simpler and more reliable solution than the webhook approach!

## What's Already Done

✅ Created `.github/workflows/deploy.yml` workflow file
✅ Generated SSH key pair for GitHub Actions
✅ Added public key to server's authorized_keys

## Setup Instructions (2 Steps)

### Step 1: Add SSH Private Key to GitHub Secrets

1. Copy the private key that was displayed above (between `-----BEGIN OPENSSH PRIVATE KEY-----` and `-----END OPENSSH PRIVATE KEY-----`, including those lines)

2. Go to your repository settings:
   https://github.com/JordanG8/presentation/settings/secrets/actions

3. Click **"New repository secret"**

4. Enter:
   - **Name**: `SSH_PRIVATE_KEY`
   - **Value**: Paste the entire private key (including BEGIN and END lines)

5. Click **"Add secret"**

### Step 2: Push the Workflow File to GitHub

The workflow file is already created locally. You just need to commit and push it:

```bash
cd /root/presentation
git add .github/workflows/deploy.yml
git commit -m "Add GitHub Actions auto-deployment workflow"
git push origin main
```

## How It Works

Once set up, every time you push to the main branch:

1. GitHub Actions triggers automatically
2. It connects to your server via SSH
3. Pulls the latest code
4. Rebuilds and restarts the Docker container
5. All done in ~30 seconds!

## Monitoring Deployments

- View deployment status: https://github.com/JordanG8/presentation/actions
- Each push will show a workflow run with status (success/failure)
- Click on any run to see detailed logs

## Benefits Over Webhooks

- ✅ No need to expose ports or manage webhook listeners
- ✅ Built-in logging and monitoring in GitHub UI
- ✅ Industry standard approach
- ✅ Better security (GitHub manages the connection)
- ✅ Can run tests before deploying
- ✅ No additional services to maintain on your server

## Troubleshooting

If deployment fails, check the Actions tab on GitHub for detailed error logs.

Common issues:
- SSH key not added to secrets correctly (make sure to include BEGIN/END lines)
- Server IP changed (update in workflow file)
- Docker or git not available on server
