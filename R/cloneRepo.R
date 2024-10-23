# Clone Repo
#
# This is a function that clones a single repo.
# It requires a repo, the owner username,
# and a path to download the repo.
#
# The default path is a folder in the working directory
# called "student_repos".
#

clone_repo <- function(repo, owner,
                       basePath = "student_repos") {
  repoUrl <- sprintf("https://github.com/%s/%s.git", owner, repo)
  repoPath <- file.path(basePath, repo)

  if (dir.exists(repoPath)) {
    cat(sprintf("Repository %s already exists. Pulling latest changes.\n", repo))
    system2("git", c("-C", repoPath, "pull"), stdout = TRUE, stderr = TRUE)
  } else {
    cat(sprintf("Cloning repository %s\n", repo))
    dir.create(basePath, recursive = TRUE, showWarnings = FALSE)
    system2("git", c("clone", repoUrl, repoPath), stdout = TRUE, stderr = TRUE)
  }
}
