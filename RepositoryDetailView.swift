//
//  RepositoryDetailView.swift
//  GitHubRepository
//
//  Created by navya jyothi on 1/7/25.
//


//
//  RepositoryDetailView.swift
//  GitHubRepos
//
//  Created by navya jyothi on 1/7/25.
//

import SwiftUI

struct RepositoryDetailView: View {
    let repository: Repository

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(repository.name).font(.largeTitle)
            Text(repository.description ?? "No description available").font(.body)
            Text("Language: \(repository.language ?? "Unknown")")
            Text("Last updated: \(repository.updatedAt)")
            Text("Owner: \(repository.owner)")
            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
}
