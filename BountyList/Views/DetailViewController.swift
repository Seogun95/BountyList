//
//  DetailViewController.swift
//  BountyList
//
//  Created by Seogun Kim on 2021/07/15.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MVVM
    
    /*
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
     */
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel : UILabel!
    @IBOutlet weak var NameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var BountyLabelCenterX: NSLayoutConstraint!
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showAnimation()
    }
    
    private func prepareAnimation() {
        //        NameLabelCenterX.constant = view.bounds.width
        //        BountyLabelCenterX.constant = view.bounds.width
        
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).rotated(by: 180).scaledBy(x: 3, y: 3)
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).rotated(by: 180).scaledBy(x: 3, y: 3)
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
    }
    
    private func showAnimation() {
        //        NameLabelCenterX.constant = 0
        //        BountyLabelCenterX.constant = 0
        //
        //        // 레이어 애니메이션 효과
        //        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 3, options: .allowUserInteraction, animations: {
        //            self.view.layoutIfNeeded()
        //        }, completion: nil)
        //
        //        // 이미지 뷰 애니메이션 효과
        //        UIView.transition(with: imgView, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.nameLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.bountyLabel.transform = CGAffineTransform.identity
            self.bountyLabel.alpha = 1
        }, completion: nil)
        
        UIView.transition(with: imgView, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
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
