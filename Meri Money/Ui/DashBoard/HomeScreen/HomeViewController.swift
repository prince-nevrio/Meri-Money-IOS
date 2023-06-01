//
//  HomeViewController.swift
//  Meri Money
//
//  Created by Prince Saini on 29/05/23.
//

import UIKit

class HomeViewController : BaseViewController , UICollectionViewDelegate,UICollectionViewDataSource{
            
    @IBOutlet weak var categoryPageControl: UIPageControl!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var icSearchButton: UIImageView!
    @IBOutlet weak var searchBarTextField: UITextField!
    
    let categoryDataList : [String] = ["adds","adds","adds"]
    var currentPage = 0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? AddsCollectionViewCell
        cell?.categoryImage.image = UIImage(named: categoryDataList[indexPath.row])
        cell?.categoryImage.layer.cornerRadius = 8.0
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        categoryPageControl.currentPage=indexPath.row
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       initSearchBarView()
        categoryPageControl.currentPage = 0
        categoryPageControl.numberOfPages = categoryDataList.count
    }
    
    func initSearchBarView(){
        searchBarTextField.addingPaddingToTextField()
        searchBarTextField.layer.cornerRadius = 20
        searchBarTextField.clipsToBounds = true
        searchBarTextField.layer.borderColor = UIColor.white.cgColor
        searchBarTextField.layer.borderWidth = 1
        icSearchButton.layer.cornerRadius = 18
    }

}

extension UITextField{
    func addingPaddingToTextField(){
        let paddingView : UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
