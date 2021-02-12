//
//  DogViewController.swift
//  Dogstagram(UICollectionView)
//
//  Created by Jovial Software on 15/12/20.
//

import UIKit

class DogViewController: UIViewController {
    var photo = UIImage()
    var tit = ""
    var prop = ""
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Prop: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Name.text = tit
        Img.image = photo
        Prop.text = prop
    }
}
