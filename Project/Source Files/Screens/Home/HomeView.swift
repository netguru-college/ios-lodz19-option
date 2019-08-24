//
//  HelloWorldView.swift
//  NetguruCollegeApp
//

import UIKit

final class HomeView: UIView {

    @IBOutlet var moviesCollectionView: UICollectionView!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "HomeView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
