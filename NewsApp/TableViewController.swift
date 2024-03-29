//
//  ViewController.swift
//  NewsApp
//
//  Created by karingula Lingaswami on 25/03/24.
//

import UIKit

class TableViewController: UITableViewController {

    var articleListViewModel:ArticleListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
    }

    func setUp() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0f7362c429c84235a3e09c6fad35bb75")!
        WebService().getArticles(url: url) { articles in
            
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numbetOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        let articleVM = self.articleListViewModel.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.tittle
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
}

