//
//  ContactCell.swift
//  Glontact
//
//  Created by Lucas Farah on 02/03/23.
//

import UIKit

class ContactCell: UITableViewCell {

    private lazy var nameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    private lazy var companyLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        return view
    }()

    public var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    
    public var company: String? {
        didSet {
            companyLabel.text = company
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(companyLabel)

        // TODO: Remove hardcoded values
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true

        companyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        companyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        companyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        companyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }
}
