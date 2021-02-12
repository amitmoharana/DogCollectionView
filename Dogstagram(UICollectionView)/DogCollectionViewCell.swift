//
//  DogCollectionViewCell.swift
//  Dogstagram(UICollectionView)
//
//  Created by Jovial Software on 15/12/20.
//

import UIKit
protocol DataCollectionProtocol{
    func passData(index:Int)
    func deleteData(index:Int)
}
class DogCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var DogImageView: UIImageView!
    
    @IBOutlet weak var DogName: UILabel!
    var index:IndexPath?
    var delegate:DataCollectionProtocol?
    @IBAction func Show(_ sender: Any) {
        delegate?.passData(index: index!.row)
    }
    @IBAction func Delete(_ sender: Any) {
        delegate?.deleteData(index: index!.row)
    }
}
