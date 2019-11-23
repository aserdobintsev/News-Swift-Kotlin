//
//  ContentView.swift
//  NewsApp-iOS
//
//  Created by Alexander Serdobintsev on 11/20/19.
//  Copyright © 2019 Alexander Serdobintsev. All rights reserved.
//

import SwiftUI
import Combine

final class ArticlesViewModel: ObservableObject {
    @Published var articles = [Article]()

    init() {
        ArticlesAPI.everythingGet(q: "bitcoin", from: "2019-11-01", sortBy: "publishedAt", apiKey: "b5d7fe5c9d3d4e238e5e714d86b251e0"){ articleList, error in
            if let articles = articleList?.articles {
                self.articles = articles
                print("\(self.articles.count)")
            }
        }
    }
}

struct ContentView: View {

    @ObservedObject var articleVM = ArticlesViewModel()

    var body: some View {
        List {
            ForEach(articleVM.articles, id: \.publishedAt) { article in
                Text(article.title ?? "")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
