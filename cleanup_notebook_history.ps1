# Backup your repository first!
# Install nbstripout and git-filter-repo if not already installed
# pip install nbstripout
# pip install git-filter-repo

# Download git-filter-repo for Windows from https://github.com/newren/git-filter-repo/releases
# Place git-filter-repo.exe somewhere in your PATH or in the repo root

# 1. Install nbstripout for the repo (future commits)
# nbstripout --install

# 2. Strip outputs from all notebooks in the current working tree (optional, for current state)
nbstripout --strip --keep --force

# 3. Generate a replace-text file for git-filter-repo
nbstripout --generate-replace-text > strip.txt

# 4. Rewrite git history to remove outputs from all .ipynb files
# (Assumes git-filter-repo.exe is in your PATH or repo root)
git-filter-repo --path-glob '*.ipynb' --replace-text strip.txt

# 5. Force push to remote (WARNING: this rewrites history!)
git push --force origin master

# 6. Tell collaborators to re-clone or hard reset their local repos after this operation
Write-Host "Repository cleaned. All collaborators must re-clone or reset their local copies."