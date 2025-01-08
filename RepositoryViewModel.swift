//
//  RepositoryViewModel.swift
//  GitHubRepository
//
//  Created by navya jyothi on 1/7/25.
//


//
import Foundation

class RepositoryViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var errorMessage: String? = nil
    private var currentPage = 1
    private var isLoading = false

    private let apiManager = GitHubAPIManager()

    var languages: [String] {
        let allLanguages = repositories.compactMap { $0.language }
        return Array(Set(allLanguages)).sorted() // Unique and sorted list of languages
    }

    func fetchRepositories(for user: String) {
        guard !isLoading else { return }
        isLoading = true
        apiManager.fetchRepositories(for: user, page: currentPage) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let repos):
                    self?.repositories.append(contentsOf: repos)
                    self?.currentPage += 1
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func filteredRepositories(for language: String) -> [Repository] {
        if language == "All" {
            return repositories
        } else {
            return repositories.filter { $0.language?.lowercased() == language.lowercased() }
        }
    }
}

