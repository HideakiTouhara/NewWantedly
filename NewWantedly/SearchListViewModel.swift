//
//  SearchListViewModel.swift
//  NewWantedly
//
//  Created by HideakiTouhara on 2018/04/29.
//  Copyright © 2018年 HideakiTouhara. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import APIKit

class SearchListViewModel: NSObject {
    var companyList = BehaviorRelay<[CompanyResponse]>(value: [])
    var error = BehaviorRelay<Error?>(value: nil)
    let bag = DisposeBag()
    
    override init() {
        super.init()
    }
    
    func reloadData(query: String) {
        let request = CompanyRequest(query: query)
        Session.rx_sendRequest(request: request)
            .subscribe {
                [weak self] event in
                switch event {
                case .next(let res):
                    self?.companyList.accept(res)
                case .error(let error):
                    self?.error.accept(error)
                default: break
                }
            }
            .disposed(by: bag)
    }
}
