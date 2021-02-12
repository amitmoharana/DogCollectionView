//
//  ViewController.swift
//  Dogstagram(UICollectionView)
//
//  Created by Jovial Software on 15/12/20.
//

import UIKit
struct DogItem{
    var imageName:String
    var properties:String
}
class ViewController: UIViewController {
    enum Mode{
        case view
        case select
    }
    @IBOutlet weak var DogCollectionView: UICollectionView!

    var item:[DogItem] = [DogItem(imageName: "Chowchow",properties: "It's an small breed"),
                          DogItem(imageName: "Bigle",properties: "It's an small breed"),
                          DogItem(imageName: "Husky",properties: "It's an large breed"),
                          DogItem(imageName: "Labrador",properties: "It's an large breed"),
                          DogItem(imageName: "Pug",properties: "It's an small breed"),
                          DogItem(imageName: "Jerman",properties: "It's an large breed"),
                          DogItem(imageName: "Bulldog",properties: "It's an large breed"),
                          DogItem(imageName: "Golden Retriver",properties: "It's an large breed"),
                          DogItem(imageName: "BichonFrise",properties: "It's an small breed"),
                          DogItem(imageName: "Pomerian",properties: "It's an small breed")
                         ]
    var collectionViewFlowLayout :UICollectionViewFlowLayout!
    var mMode:Mode = .view
    lazy var selectBarButton:UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: nil)
        return barButtonItem
    }()
    lazy var deleteBarButton:UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: nil)
        return barButtonItem
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        DogCollectionView.delegate = self
        DogCollectionView.dataSource = self
        DogCollectionView.collectionViewLayout = UICollectionViewFlowLayout()

    }
    
    @IBAction func addItem(_ sender: Any) {
        
    }
}
extension ViewController: DataCollectionProtocol{
    func passData(index: Int) {
        let vc = storyboard?.instantiateViewController(identifier: "DogViewController") as? DogViewController
        guard let pic = UIImage(named: item[index].imageName) else {
            return
        }
        vc?.photo = pic
        vc?.tit = item[index].imageName
        vc?.prop = item[index].properties
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func deleteData(index: Int) {
        item.remove(at: index)
        DogCollectionView.reloadData()
    }
    
    
}
extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DogCollectionViewCell", for: indexPath) as! DogCollectionViewCell
        cell.DogImageView.image = UIImage(named: item[indexPath.row].imageName)
        cell.DogName.text = item[indexPath.row].imageName
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    
}
extension ViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(identifier: "DogViewController") as? DogViewController
//        guard let pic = UIImage(named: item[indexPath.row].imageName) else {
//            return
//        }
//        vc?.photo = pic
//        vc?.tit = item[indexPath.row].imageName
//        vc?.prop = item[indexPath.row].properties
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = DogCollectionView.bounds
        return CGSize(width: bounds.width / 2, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
