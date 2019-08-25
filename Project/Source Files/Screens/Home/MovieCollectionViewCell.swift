//
//  MovieCollectionViewCell.swift
//  NetguruCollegeApp
//

import Kingfisher
import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    var posterImageTask: DownloadTask?

    lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private func sharedInit() {
        addSubview(moviePosterImageView)

        moviePosterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        moviePosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        moviePosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        moviePosterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        moviePosterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }

    override func prepareForReuse() {
        posterImageTask?.cancel()
    }
}
