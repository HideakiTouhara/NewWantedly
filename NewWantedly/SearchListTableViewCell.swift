//
//  SearchListTableViewCell.swift
//  NewWantedly
//
//  Created by HideakiTouhara on 2018/04/29.
//  Copyright © 2018年 HideakiTouhara. All rights reserved.
//

import UIKit

class SearchListTableViewCell: UITableViewCell {

    @IBOutlet weak var comanyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepare(res: CompanyResponse) {
        comanyName.text = res.company.name
    }
}
