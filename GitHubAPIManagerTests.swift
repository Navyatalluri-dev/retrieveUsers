//
//  GitHubAPIManagerTests.swift
//  GitHubRepository
//
//  Created by navya jyothi on 1/7/25.
//


import XCTest
@testable import GitHubRepository

final class GitHubAPIManagerTests: XCTestCase {
    var apiManager: GitHubAPIManager!

    override func setUp() {
        super.setUp()
        apiManager = GitHubAPIManager()
    }

    override func tearDown() {
        apiManager = nil
        super.tearDown()
    }

    func testFetchRepositoriesSuccess() {
        let expectation = self.expectation(description: "Repositories fetched successfully")

        apiManager.fetchRepositories(for: "google", page: 1) { result in
            switch result {
            case .success(let repositories):
                XCTAssertGreaterThan(repositories.count, 0)
                expectation.fulfill()
            case .failure:
                XCTFail("Expected success but got failure")
            }
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testFetchRepositoriesFailure() {
        let expectation = self.expectation(description: "Failed to fetch repositories")

        // Provide an invalid username to cause failure
        apiManager.fetchRepositories(for: "", page: 1) { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}
