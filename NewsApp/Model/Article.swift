//
//  Article.swift
//  NewsApp
//
//  Created by karingula Lingaswami on 25/03/24.
//

import Foundation

struct ArticleList : Decodable {
    var articles:[Article]
}

struct Article : Decodable {
    var title:String
    var description:String
}
