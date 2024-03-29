//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by karingula Lingaswami on 25/03/24.
//

import Foundation

struct ArticleListViewModel {
    var articles: [Article]
}

extension ArticleListViewModel {
    
    func numbetOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}
struct ArticleViewModel {
    var article:Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var tittle: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
}
