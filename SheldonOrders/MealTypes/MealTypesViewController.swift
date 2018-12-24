//
//  MealTypesViewController.swift
//  SheldonOrders
//
//  Created by Zsolt Pete on 2018. 12. 06..
//  Copyright © 2018. Zsolt Pete. All rights reserved.
//

import UIKit

class MealTypesViewController: UIViewController, CollectionViewNibRegistration {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let mealTypeMocker = MealTypeMocker()
    lazy var mealTypes = self.mealTypeMocker.getMealType()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.registerCollectionViewNibs(nibName: Cells.MealTypeCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
    }
    
    func showMeals(_ model: MealTypeCellBindable?){
        guard let mealSelectionViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIds.MealSelectionViewController) as? MealSelectionViewController else {
            return
        }
        if let mealType = model as? MealType {
            mealSelectionViewController.mealType = mealType
        }
        self.navigationController?.pushViewController(mealSelectionViewController, animated: true)
        
    }

}

extension MealTypesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mealTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.MealTypeCell, for: indexPath) as? MealTypeCell else {
            return UICollectionViewCell()
        }
        cell.bind(model: mealTypes[indexPath.row])
        return cell
    }
    
}

extension MealTypesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MealTypeCell else {
            return
        }
        let model = cell.item
        self.showMeals(model)
    }
    
}

extension MealTypesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 167.0, height: 193)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 56, left: 0.0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
