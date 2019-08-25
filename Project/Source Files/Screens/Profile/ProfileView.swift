//
//  ProfileView.swift
//  NetguruCollegeApp
//


import UIKit

class ProfileView: UIView {

    @IBOutlet var tableView: UITableView!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ProfileView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
