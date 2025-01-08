//
//  RepositoryViewModelTests.swift
//  GitHubRepository
//
//  Created by navya jyothi on 1/7/25.
//


import XCTest
@testable import GitHubRepository

final class RepositoryViewModelTests: XCTestCase {
    var viewModel: RepositoryViewModel!
    var mockAPIManager: MockGitHubAPIManager!

    override func setUp() {
        super.setUp()
        mockAPIManager = MockGitHubAPIManager()
        viewModel = RepositoryViewModel(apiManager: mockAPIManager)
    }

    override func tearDown() {
        viewModel = nil
        mockAPIManager = nil
        super.tearDown()
    }

    func testFetchRepositoriesSuccess() {
        // Arrange
        let mockRepo = Repository(
            name: "TestRepo",
            description: "A test repository",
            language: "Swift",
            stargazersCount: 42,
            forksCount: 10,
            updatedAt: "2025-01-07",
            owner: Owner(login: "testuser", avatarUrl: "https://example.com/avatar.png")
        )
        mockAPIManager.mockRepositories = [mockRepo]

        // Act
        viewModel.fetchRepositories(for: "testuser")

        // Assert
        XCTAssertEqual(viewModel.repositories.count, 1)
        XCTAssertEqual(viewModel.repositories.first?.name, "TestRepo")
    }

    func testFetchRepositoriesFailure() {
        // Arrange
        mockAPIManager.shouldReturnError = true

        // Act
        viewModel.fetchRepositories(for: "testuser")

        // Assert
        XCTAssertEqual(viewModel.repositories.count, 0)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.errorMessage, "Mock error")
    }

    func testFilterRepositoriesByLanguage() {
        // Arrange
        let repo1 = Repository(
            name: "Repo1",
            description: "A Swift repository",
            language: "Swift",
            stargazersCount: 10,
            forksCount: 2,
            updatedAt: "2025-01-07",
            owner: Owner(login: "user1", avatarUrl: "https://example.com/avatar1.png")
        )
        let repo2 = Repository(
            name: "Repo2",
            description: "A Java repository",
            language: "Java",
            stargazersCount: 5,
            forksCount: 1,
            updatedAt: "2025-01-06",
            owner: Owner(login: "user2", avatarUrl: "https://example.com/avatar2.png")
        )
        mockAPIManager.mockRepositories = [repo1, repo2]
        viewModel.fetchRepositories(for: "testuser")

        // Act
        let swiftRepos = viewModel.filteredRepositories(for: "Swift")
        let javaRepos = viewModel.filteredRepositories(for: "Java")

        // Assert
        XCTAssertEqual(swiftRepos.count, 1)
        XCTAssertEqual(swiftRepos.first?.name, "Repo1")
        XCTAssertEqual(javaRepos.count, 1)
        XCTAssertEqual(javaRepos.first?.name, "Repo2")
    }
}
