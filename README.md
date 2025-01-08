# GitHub Repository

GitHub Repository is an iOS application built with Swift and SwiftUI that allows users to explore GitHub repositories for a specific user or organization. The app fetches data from the GitHub API and displays repositories with filtering and pagination support.

## Features

- **View Repositories**: Fetch and display a list of repositories for a specific GitHub user or organization.
- **Filter by Language**: Filter repositories by programming language (e.g., Swift).
- **Repository Details**: View additional details about a selected repository, including name, description, language, stars, forks, and the owner's avatar.
- **Pagination**: Load more repositories as the user scrolls.
- **Error Handling**: Gracefully handle network errors and API rate limits with user-friendly error messages.

## Technologies Used

- **Swift**: Core programming language.
- **SwiftUI**: User Interface framework for building declarative UIs.
- **GitHub API**: REST API for fetching repository data.
- **MVVM Architecture**: Model-View-ViewModel for better separation of concerns and testability.

## Screenshots

_TODO: Add screenshots of the app here (e.g., repository list view, filter picker, details view)._

## Getting Started

### Prerequisites

- macOS with Xcode 14 or later.
- A valid GitHub account to access public repositories via the GitHub API.

### Installation

1. Clone the repository:
  
   git clone https://github.com/your-username/GitHubRepository.git

2. Open the project in Xcode:
  cd GitHubRepository
  open GitHubRepository.xcodeproj
3. Run the app in the simulator or on a connected device

**Usage**
1. Enter a GitHub username or organization (e.g., google).
2. View the list of repositories.
3. Use the language filter to narrow down results.
4. Tap on a repository to view more details.
5. Scroll to the bottom of the list to load more repositories.

   
**Project Structure**


The project follows the MVVM architecture for clear separation of concerns:
GitHubRepository
├── Model
│   └── Repository.swift          // Defines the repository data structure
├── View
│   ├── RepositoryListView.swift  // Main view displaying repositories
│   └── RepositoryDetailView.swift // Detailed view for a repository
├── ViewModel
│   └── RepositoryViewModel.swift // Handles business logic and API interactions
├── Services
│   └── GitHubAPIManager.swift    // Handles network requests to GitHub API
└── Assets.xcassets                // Contains app assets and icons

**Testing**
The project includes unit tests for the RepositoryViewModel and GitHubAPIManager.

**Running Tests**
Open the project in Xcode.
Select the test target (GitHubRepositoryTests).
Run the tests:
Go to Product > Test or press ⌘ + U.
Test Cases
RepositoryViewModelTests:

Fetch repositories successfully.
Handle API failures gracefully.
Filter repositories by language.
GitHubAPIManagerTests:

Verify successful fetching of repositories.
Handle error cases like invalid usernames or network issues.
API Reference
The app uses the following GitHub API endpoint:

**Fetch Repositories:**
Endpoint: https://api.github.com/users/{username}/repos
Example: https://api.github.com/users/google/repos
**Rate Limits**
The GitHub API enforces rate limits:

60 requests/hour for unauthenticated requests.
Use a personal access token to increase the rate limit to 5000 requests/hour.
**Future Enhancements**
Add a search bar to search repositories dynamically by name.
Support authentication for private repositories.
Display contributor statistics for each repository.


**Acknowledgments**
GitHub API Documentation - https://docs.github.com/en/rest?apiVersion=2022-11-28
SwiftUI Documentation - https://developer.apple.com/documentation/swiftui
MVVM Design Pattern - 




