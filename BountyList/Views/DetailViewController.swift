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

    
    let viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        

        
        if let bountyInfo = viewModel.BountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: VIEWMODEL
class DetailViewModel {
    var BountyInfo: bountyInfo?
    
    func update(model: bountyInfo?) {
        return BountyInfo = model
    }
}
