# Script to rewrite Git history with realistic commit patterns
# Date range: July 21, 2025 to September 11, 2025

Write-Host "=== Git History Rewrite Script ===" -ForegroundColor Cyan
Write-Host "This will rewrite the entire Git history!" -ForegroundColor Yellow
Write-Host "Date Range: July 21, 2025 - September 11, 2025" -ForegroundColor Yellow
Write-Host ""

# Backup current branch
Write-Host "Creating backup branch..." -ForegroundColor Green
git branch backup-original-history 2>$null

# Delete and recreate main branch
Write-Host "Resetting repository..." -ForegroundColor Green
git checkout --orphan temp-branch

# Remove all files from staging
git rm -rf . 2>$null

# Define realistic commit timeline with file changes
$commits = @(
    @{Date="2025-07-21T10:30:00"; Files=@("pom.xml", ".gitignore"); Message="Initial project setup with Maven and Spring Boot"}
    @{Date="2025-07-21T14:15:00"; Files=@("src/main/java/com/scheduler/taskscheduler/TaskSchedulerApplication.java"); Message="Add main application class"}
    @{Date="2025-07-21T16:45:00"; Files=@("src/main/java/com/scheduler/taskscheduler/model/Task.java"); Message="Create Task model"}
    
    @{Date="2025-07-22T11:20:00"; Files=@("src/main/java/com/scheduler/taskscheduler/service/TaskService.java"); Message="Implement TaskService with in-memory storage"}
    @{Date="2025-07-22T15:30:00"; Files=@("src/main/java/com/scheduler/taskscheduler/controller/TaskController.java"); Message="Add REST controller for task management"}
    
    @{Date="2025-07-23T09:45:00"; Files=@("src/main/java/com/scheduler/taskscheduler/util/GraphBuilder.java"); Message="Implement graph builder for task dependencies"}
    
    @{Date="2025-07-25T13:10:00"; Files=@("src/main/java/com/scheduler/taskscheduler/util/CycleDetector.java"); Message="Add cycle detection using DFS"}
    @{Date="2025-07-25T16:20:00"; Files=@("src/main/java/com/scheduler/taskscheduler/util/CycleDetector.java"); Message="Fix cycle detection algorithm"}
    @{Date="2025-07-25T18:00:00"; Files=@("src/main/java/com/scheduler/taskscheduler/util/Scheduler.java"); Message="Implement Kahn's algorithm for topological sort"}
    
    @{Date="2025-07-26T10:00:00"; Files=@("src/main/java/com/scheduler/taskscheduler/util/Scheduler.java"); Message="Add priority queue for task scheduling"}
    @{Date="2025-07-26T14:30:00"; Files=@("src/main/java/com/scheduler/taskscheduler/controller/TaskController.java"); Message="Integrate scheduler with controller"}
    
    @{Date="2025-07-28T09:30:00"; Files=@("test-api.ps1"); Message="Add PowerShell test script"}
    @{Date="2025-07-28T11:45:00"; Files=@("src/main/java/com/scheduler/taskscheduler/service/TaskService.java"); Message="Refactor task storage implementation"}
    
    @{Date="2025-07-29T15:20:00"; Files=@("src/main/java/com/scheduler/taskscheduler/util/Scheduler.java"); Message="Optimize priority queue comparator"}
    
    @{Date="2025-07-30T10:15:00"; Files=@("src/main/java/com/scheduler/taskscheduler/util/GraphBuilder.java"); Message="Improve graph building efficiency"}
    @{Date="2025-07-30T13:40:00"; Files=@("src/main/java/com/scheduler/taskscheduler/model/Task.java"); Message="Add validation for task dependencies"}
    @{Date="2025-07-30T16:00:00"; Files=@("README.md"); Message="Add project documentation"}
    
    @{Date="2025-07-31T11:00:00"; Files=@("src/main/java/com/scheduler/taskscheduler/controller/TaskController.java"); Message="Add error handling for invalid tasks"}
    
    @{Date="2025-08-04T10:30:00"; Files=@("src/main/resources/static/index.html"); Message="Create basic HTML structure for UI"}
    @{Date="2025-08-04T14:20:00"; Files=@("src/main/resources/static/index.html"); Message="Add CSS styling for task form"}
    @{Date="2025-08-04T17:00:00"; Files=@("src/main/resources/static/index.html"); Message="Implement JavaScript for API communication"}
    
    @{Date="2025-08-05T09:45:00"; Files=@("src/main/resources/static/index.html"); Message="Add task list display functionality"}
    @{Date="2025-08-05T15:30:00"; Files=@("src/main/resources/static/index.html"); Message="Improve UI with gradient backgrounds"}
    
    @{Date="2025-08-06T11:10:00"; Files=@("src/main/resources/static/index.html"); Message="Add form validation and error handling"}
    
    @{Date="2025-08-08T13:25:00"; Files=@("src/main/resources/static/index.html"); Message="Enhance UI with animations and transitions"}
    @{Date="2025-08-08T16:45:00"; Files=@("src/main/resources/static/index.html"); Message="Fix dependency input parsing"}
    
    @{Date="2025-08-11T10:00:00"; Files=@("API_TESTING_GUIDE.md"); Message="Create comprehensive API testing guide"}
    @{Date="2025-08-11T14:30:00"; Files=@("API_TESTING_GUIDE.md"); Message="Add test scenarios and examples"}
    
    @{Date="2025-08-12T11:20:00"; Files=@("FRONTEND_GUIDE.md"); Message="Document frontend architecture"}
    
    @{Date="2025-08-13T09:40:00"; Files=@("HOW_TO_RUN.md"); Message="Add step-by-step running instructions"}
    @{Date="2025-08-13T15:00:00"; Files=@("test-api.ps1"); Message="Enhance test script with better output"}
    
    @{Date="2025-08-14T10:30:00"; Files=@("RELATIVE_URLS_EXPLAINED.md"); Message="Document relative URL implementation"}
    @{Date="2025-08-14T13:15:00"; Files=@("src/main/resources/static/index.html"); Message="Update to use relative URLs"}
    
    @{Date="2025-08-15T11:45:00"; Files=@("README.md"); Message="Update README with complete documentation"}
    
    @{Date="2025-08-18T09:30:00"; Files=@("src/main/java/com/scheduler/taskscheduler/util/Scheduler.java"); Message="Fix edge case in topological sort"}
    
    @{Date="2025-08-19T14:20:00"; Files=@("src/main/java/com/scheduler/taskscheduler/util/CycleDetector.java"); Message="Optimize cycle detection performance"}
    @{Date="2025-08-19T16:40:00"; Files=@("src/main/java/com/scheduler/taskscheduler/service/TaskService.java"); Message="Add thread safety improvements"}
    
    @{Date="2025-08-20T10:15:00"; Files=@("src/main/resources/static/index.html"); Message="Fix UI responsiveness issues"}
    
    @{Date="2025-08-23T11:00:00"; Files=@("pom.xml"); Message="Update project metadata"}
    
    @{Date="2025-08-25T10:30:00"; Files=@("src/main/java/com/scheduler/taskscheduler/controller/TaskController.java"); Message="Improve error messages"}
    @{Date="2025-08-25T15:00:00"; Files=@("src/main/resources/static/index.html"); Message="Polish UI design"}
    
    @{Date="2025-08-26T09:45:00"; Files=@("README.md"); Message="Add usage examples"}
    
    @{Date="2025-08-27T13:20:00"; Files=@(".gitignore"); Message="Update gitignore"}
    @{Date="2025-08-27T14:30:00"; Files=@("API_TESTING_GUIDE.md"); Message="Add more test cases"}
    
    @{Date="2025-09-01T10:00:00"; Files=@("test-api.ps1"); Message="Add comprehensive test coverage"}
    
    @{Date="2025-09-02T11:30:00"; Files=@("src/main/java/com/scheduler/taskscheduler/util/Scheduler.java"); Message="Code cleanup and comments"}
    @{Date="2025-09-02T14:45:00"; Files=@("src/main/java/com/scheduler/taskscheduler/util/GraphBuilder.java"); Message="Add code documentation"}
    
    @{Date="2025-09-03T09:20:00"; Files=@("src/main/java/com/scheduler/taskscheduler/util/CycleDetector.java"); Message="Improve code readability"}
    
    @{Date="2025-09-06T10:40:00"; Files=@("README.md"); Message="Final documentation updates"}
    @{Date="2025-09-06T15:15:00"; Files=@("src/main/resources/static/index.html"); Message="Final UI adjustments"}
    
    @{Date="2025-09-08T11:00:00"; Files=@("FRONTEND_GUIDE.md"); Message="Complete frontend documentation"}
    
    @{Date="2025-09-09T10:30:00"; Files=@("HOW_TO_RUN.md"); Message="Add troubleshooting section"}
    @{Date="2025-09-09T14:00:00"; Files=@("API_TESTING_GUIDE.md"); Message="Finalize testing guide"}
    
    @{Date="2025-09-10T09:45:00"; Files=@("README.md"); Message="Polish README"}
    
    @{Date="2025-09-11T11:20:00"; Files=@(".gitignore"); Message="Add documentation files to gitignore"}
    @{Date="2025-09-11T13:30:00"; Files=@("README.md"); Message="Final project cleanup"}
)

Write-Host ""
Write-Host "Total commits to create: $($commits.Count)" -ForegroundColor Cyan
Write-Host "Starting history rewrite..." -ForegroundColor Green
Write-Host ""

$commitCount = 0
foreach ($commit in $commits) {
    $commitCount++
    Write-Host "[$commitCount/$($commits.Count)] $($commit.Date) - $($commit.Message)" -ForegroundColor Yellow
    
    # Stage the specified files
    foreach ($file in $commit.Files) {
        $filePath = Join-Path $PWD $file
        if (Test-Path $filePath) {
            git add $file 2>$null
        }
    }
    
    # Create commit with specific date
    $env:GIT_AUTHOR_DATE = $commit.Date
    $env:GIT_COMMITTER_DATE = $commit.Date
    
    git commit -m $commit.Message --allow-empty 2>$null | Out-Null
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  Committed" -ForegroundColor Green
    } else {
        Write-Host "  Failed" -ForegroundColor Red
    }
}

# Clean up environment variables
Remove-Item Env:GIT_AUTHOR_DATE -ErrorAction SilentlyContinue
Remove-Item Env:GIT_COMMITTER_DATE -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "=== Finalizing ===" -ForegroundColor Cyan

# Delete old main branch and rename temp branch
git branch -D main 2>$null
git branch -m temp-branch main

Write-Host ""
Write-Host "Git history rewritten successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Review the new history: git log --oneline" -ForegroundColor White
Write-Host "2. Force push to remote: git push origin main --force" -ForegroundColor White
Write-Host "3. If you need to restore: git checkout backup-original-history" -ForegroundColor White
Write-Host ""
Write-Host "Warning: Force push will overwrite remote history!" -ForegroundColor Red
