//
//  CompanyDetailViewController.swift
//  NewWantedly
//
//  Created by HideakiTouhara on 2018/04/30.
//  Copyright © 2018年 HideakiTouhara. All rights reserved.
//

import UIKit
import PINRemoteImage

class CompanyDetailViewController: UIViewController {

    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var position: UILabel! {
        didSet {
            position.layer.borderWidth = 1
            position.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var comanyImage: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var jobDescription: UILabel!
    
    var companyResponse: CompanyResponse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let res = companyResponse {
            prepare(res: res)
        }
        viewHeight.constant = jobDescription.sizeThatFits(CGSize(width: jobDescription.frame.size.width, height: CGFloat.greatestFiniteMagnitude)).height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func prepare(res: CompanyResponse) {
        self.navigationItem.title = res.company.name
        mainImage.pin_setImage(from: URL(string: res.image.original))
        position.text = res.lookingFor
        jobTitle.text = res.title
        comanyImage.pin_setImage(from: URL(string: res.company.avatar.original))
        companyName.text = res.company.name
        jobDescription.text = res.description
    }
}
