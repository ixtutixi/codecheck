//
//  Repository.swift
//  iOSEngineerCodeCheck
//
//  Created by 高橋龍一 on 2023/01/10.
//  Copyright © 2023 YUMEMI Inc. All rights reserved.
//

import UIKit

struct Repository: Decodable {
    
    let items: [Item]
    
    struct Item: Decodable {
        
        let language: String?
        let stargazersCount: Int
        let watchersCount: Int
        let forksCount: Int
        let openIssuesCount: Int
        let fullName: String
        let owner: Owner
        
        struct Owner: Decodable {
            let avatarUrl: String
        }
    }
    
}
