//
//  DetailViewController.swift
//  BountyList
//
//  Created by Seogun Kim on 2021/07/15.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MVVM
    
    // Model
    // - bountyInfo
    // > bountyInfo 만들기
    
    // View
    // - imgView, nameLabel, bountyLabel
    // > view들은 viewModel을 통해 구성됨
    
    // ViewModel
    // - DetailViewModel
    // > 뷰레이어에서 필요한 메소드 만들기
    // > Model 가지고 있기 (bountyInfo)
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel : UILabel!
    
//    var name: String?
//    var bounty: Int?

    var bountyInfo: bountyInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        
        if let bountyInfo = self.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        } 
//        if let name = self.name, let bounty = self.bounty {
//            let img = UIImage(named: "\(name).jpg")
//            imgView.image = img
//            nameLabel.text = name
//            bountyLabel.text = "\(bounty)"
//        }
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
