//
//  BountyViewModel.swift
//  BountyList
//
//  Created by Seogun Kim on 2021/07/19.
//

import UIKit

//MARK: VIEW MODEL
class BountyViewModel {
    let bountyInfoList: [bountyInfo] = [
        bountyInfo(name: "brook", bounty: 33000000),
        bountyInfo(name: "chopper", bounty: 33000000),
        bountyInfo(name: "franky", bounty: 44000000),
        bountyInfo(name: "luffy", bounty: 63000000),
        bountyInfo(name: "nami", bounty: 32000000),
        bountyInfo(name: "robin", bounty: 6000000),
        bountyInfo(name: "sanji", bounty: 87000000),
        bountyInfo(name: "zoro", bounty: 50000000)
    ]
    
    // 가격 순서
    var sortedList: [bountyInfo] {
        let sortedList = bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    
    var numberOfBountyList: Int {
        return bountyInfoList.count
    }
    
    func BountyInfo(at index: Int) -> bountyInfo {
        return sortedList[index]
    }
}
