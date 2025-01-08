//
//  ContentView.swift
//  GitHubRepos
//
//  Created by navya jyothi on 1/7/25.
//

import SwiftUI

struct RepositoryListView: View {
    @StateObject private var viewModel = RepositoryViewModel()
    @State private var username: String = "yahoo"
    @State private var selectedLanguage: String = "All" // Default to "All"

    var body: some View {
        NavigationView {
            VStack {
                // Language Filter Picker
                Picker("Filter by Language", selection: $selectedLanguage) {
                    Text("All").tag("All")
                    ForEach(viewModel.languages, id: \.self) { language in
                        Text(language).tag(language)
                    }
                }
                .pickerStyle(DefaultPickerStyle()) // Use SegmentedPicker or Default Picker
                .padding()

                // Repository List
                List {
                    ForEach(viewModel.filteredRepositories(for: selectedLanguage)) { repo in
                        NavigationLink(destination: RepositoryDetailView(repository: repo)) {
                            VStack(alignment: .leading) {
                                Text(repo.name).font(.headline)
                                Text(repo.description ?? "No description").font(.subheadline)
                                HStack {
                                    Text("⭐️ \(repo.stargazersCount)")
                                    Text("🍴 \(repo.forksCount)")
                                }
                            }
                        }
                    }
                    if !viewModel.repositories.isEmpty {
                        ProgressView().onAppear {
                            viewModel.fetchRepositories(for: username)
                        }
                    }
                }
            }
            .navigationTitle("Repositories")
            .onAppear {
                viewModel.fetchRepositories(for: username)
            }
            
        }
    }
}



