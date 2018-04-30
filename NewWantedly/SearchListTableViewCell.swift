//
//  SearchListTableViewCell.swift
//  NewWantedly
//
//  Created by HideakiTouhara on 2018/04/29.
//  Copyright © 2018年 HideakiTouhara. All rights reserved.
//

import UIKit
import PINRemoteImage

class SearchListTableViewCell: UITableViewCell {

    @IBOutlet weak var background: UIView! {
        didSet {
            background.backgroundColor = .white
            background.layer.cornerRadius = 10.0
            background.clipsToBounds = true
            background.layer.shadowColor = UIColor.black.cgColor
            background.layer.shadowOpacity = 0.5
            background.layer.shadowOffset = CGSize(width: 5, height: 5)
            background.layer.shadowRadius = 5

        }
    }
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var comanyName: UILabel!
    @IBOutlet weak var jobName: UILabel! {
        didSet {
            jobName.layer.borderWidth = 1
            jobName.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var tag1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepare(res: CompanyResponse) {
        mainImage.pin_setImage(from: URL(string: res.image.original))
        companyImage.pin_setImage(from: URL(string: res.company.avatar.original))
        comanyName.text = res.company.name
        jobName.text = res.lookingFor
        jobTitle.text = res.title
        if res.location != "" {
            tag1.text = "#" + res.location
        }
    }
}
