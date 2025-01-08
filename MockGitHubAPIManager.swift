//
//  MockGitHubAPIManager.swift
//  GitHubRepository
//
//  Created by navya jyothi on 1/7/25.
//


import Foundation

class MockGitHubAPIManager: GitHubAPIManager {
    var mockRepositories: [Repository] = []
    var shouldReturnError = false

    override func fetchRepositories(for user: String, page: Int, completion: @escaping (Result<[Repository], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock error"])))
        } else {
            completion(.success(mockRepositories))
        }
    }
}
