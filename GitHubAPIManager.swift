//
//  GitHubAPIManager.swift
//  GitHubRepository
//
//  Created by navya jyothi on 1/7/25.
//


//
//  GitHubAPIManager.swift
//  GitHubRepos
//
//  Created by navya jyothi on 1/7/25.
//

import Foundation

class GitHubAPIManager {
    private let baseURL = "https://api.github.com"

    func fetchRepositories(for user: String, page: Int, completion: @escaping (Result<[Repository], Error>) -> Void) {
        let urlString = "\(baseURL)/users/\(user)/repos?page=\(page)&per_page=10"
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }

            do {
                let repositories = try JSONDecoder().decode([Repository].self, from: data)
                completion(.success(repositories))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
