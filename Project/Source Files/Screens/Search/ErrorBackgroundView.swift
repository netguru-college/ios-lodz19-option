//
//  ErrorBackgroundView.swift
//  NetguruCollegeApp
//

import UIKit

class ErrorBackgroundView: UIView {

    let errorTitle = UILabel()
    let errorDescription = UILabel()

    override var frame: CGRect {
        didSet {
            setup()
        }
    }

    init() {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    func configureConstraints() {
        guard let superview = superview else { return }
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: superview.widthAnchor),
            self.heightAnchor.constraint(equalTo: superview.heightAnchor),
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        backgroundColor = .white
        // configure errorTitle
        addSubview(errorTitle)
        errorTitle.font = .systemFont(ofSize: 24)
        errorTitle.textColor = .darkGray
        errorTitle.textAlignment = .center
        errorTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            errorTitle.widthAnchor.constraint(equalToConstant: 75),
            errorTitle.heightAnchor.constraint(equalToConstant: 40),
            errorTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            errorTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150)
            ])
        // configure errorDescription
        addSubview(errorDescription)
        errorDescription.font = .systemFont(ofSize: 17)
        errorDescription.textColor = .darkText
        errorDescription.textAlignment = .center
        errorDescription.numberOfLines = 0
        errorDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            errorDescription.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            errorDescription.topAnchor.constraint(equalTo: errorTitle.bottomAnchor, constant: 5),
            errorDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            errorDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
            ])
        errorDescription.sizeToFit()
    }
}
