//
//  ResultViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starsLabel: UILabel!
    @IBOutlet private weak var watchersLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    @IBOutlet private weak var issuesLabel: UILabel!
    
    var searchViewController: SearchViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repository = searchViewController.items[searchViewController.index]
        
        languageLabel.text = "Written in \(repository.language)"
        starsLabel.text = "\(repository.stargazersCount) stars"
        watchersLabel.text = "\(repository.watchersCount) watchers"
        forksLabel.text = "\(repository.forksCount) forks"
        issuesLabel.text = "\(repository.openIssuesCount) open issues"
        
        getImage()
        
    }
    
    private func getImage() {
        
        let repository = searchViewController.items[searchViewController.index]
        titleLabel.text = repository.fullName
        let imageURL = repository.owner.avatarUrl
        
        guard  let url = URL(string: imageURL) else {
            print("error")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, _) in
            
            guard let data = data else {
                print("data is nil")
                return
            }
            
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        
        task.resume()
        
    }
}
