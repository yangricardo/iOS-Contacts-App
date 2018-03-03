//
//  ContactCell.swift
//  contacts
//
//  Created by Yang Ricardo  on 03/03/2018.
//  Copyright © 2018 Yang Ricardo . All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    var controller: UIViewController?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .red
        
        let starButton = UIButton(type: .system)
        starButton.setImage(#imageLiteral(resourceName: "star"), for: .normal)
        starButton.tintColor = .white
        starButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        starButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        accessoryView = starButton
        
    }
    
    @objc func handleMarkAsFavorite(starButton: UIButton) {
        starButton.tintColor = .yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
