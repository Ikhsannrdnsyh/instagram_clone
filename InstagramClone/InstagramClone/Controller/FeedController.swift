//
//  File.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 17/10/24.
//

import Foundation
import UIKit

class FeedController: UICollectionViewController {
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigureUI()
    }
    
    //MARK: Configure UI
    
    private func ConfigureUI(){
        collectionView.backgroundColor = UIColor.gray
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

    }
}

//MARK: UICollectionView Data Source
extension FeedController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
     
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .darkGray
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}
