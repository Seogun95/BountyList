//
//  BountyInfo.swift
//  BountyList
//
//  Created by Seogun Kim on 2021/07/19.
//

import UIKit

//MARK: MODEL
struct bountyInfo {
    let name: String
    let bounty: Int
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
