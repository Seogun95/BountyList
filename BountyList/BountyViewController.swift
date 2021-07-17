//
//  BountyViewController.swift
//  BountyList
//
//  Created by Seogun Kim on 2021/07/14.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    // MVVM
    
    // Model
    // - bountyInfo
    // > bountyInfo 만들기
    
    // View
    // - ListCell
    // > ListCell에 필요한 정보를 ViewModel로 부터 받음
    // > ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트 함
    
    // ViewModel
    // - BountyViewModel
    // > BountyViewModel을 만들고, 뷰레이어에서 필요한 메소드 만들기
    // > Model 가지고 있기 (bountyInfo)
    
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
    
//    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
//    let bountyList = [33000000, 33000000, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let bountyInfo = bountyInfoList[index]
//                vc?.name = nameList[index]
//                vc?.bounty = bountyList[index]
                vc?.bountyInfo = bountyInfo
//                vc?.name = bountyInfo.name
//                vc?.bounty = bountyInfo.bounty
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return nameList.count
        return bountyInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // list cell을 사용하기위해서 캐스팅(as?)을 사용
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let bountyInfo = bountyInfoList[indexPath.row]
//        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//        cell.imgView.image = img
//        cell.nameLabel.text = nameList[indexPath.row]
//        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        cell.imgView.image = bountyInfo.image
        cell.nameLabel.text = bountyInfo.name
        cell.bountyLabel.text = "\(bountyInfo.bounty)"
        return cell
        
        //        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell {
        //            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        //            cell.imgView.image = img
        //            cell.nameLabel.text = nameList[indexPath.row]
        //            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        //            return cell
        //        } else {
        //            return UITableViewCell()
        //        }
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("---> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel : UILabel!
}

// Model
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
