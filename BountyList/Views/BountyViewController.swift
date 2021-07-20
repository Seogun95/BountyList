//
//  BountyViewController.swift
//  BountyList
//
//  Created by Seogun Kim on 2021/07/14.
//

import UIKit

class BountyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    // MVVM

    /*
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
*/
    
    let viewModel = BountyViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let bountyInfo = viewModel.BountyInfo(at: index)
                vc?.viewModel.update(model: bountyInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // UICollectionViewDataSource
    // 셀이 몇개나 보여줄지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfBountyList
    }
    
    // 셀이 어떻게 표현 될지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        let bountyInfo = viewModel.BountyInfo(at: indexPath.item )
        cell.update(info: bountyInfo)
        return cell
    }
    
    // 셀을 클릭했을때 하는 행동
    // UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("---->\(indexPath.item)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    // UICollectionViewFlowLayout
    // 셀의 크기를 자동으로 계산
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ItemSpacing: CGFloat = 10 // width 아이템간의 간격 = 10
        let labelAreaHeight: CGFloat = 70 // 이미지 아래 label 높이 = 65
        
        let width: CGFloat = (collectionView.bounds.width - ItemSpacing)/2 // collectionView의 width 사이즈 - 10 나누기 2 = 2개의 width
        let height: CGFloat = width * 10/7 + labelAreaHeight // width * 7분의 10 + 70
        return CGSize(width: width, height: height)
    }
}

class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel : UILabel!
    
    func update(info: bountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}

