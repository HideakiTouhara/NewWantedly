//
//  ViewController.swift
//  NewWantedly
//
//  Created by HideakiTouhara on 2018/04/29.
//  Copyright © 2018年 HideakiTouhara. All rights reserved.
//

import UIKit
import APIKit
import RxSwift
import RxCocoa

class SearchListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib.init(nibName: "SearchListTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchListTableViewCell")
            tableView.rowHeight = 300
        }
    }
    @IBOutlet weak var seachBar: UISearchBar!
    
    private let viewModel = SearchListViewModel()
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        bind()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func bind() {
        viewModel.companyList
            .filter({ (x) in
                return !x.isEmpty
            })
            .subscribe(onNext: { (res) in
                self.tableView.reloadData()
            })
            .disposed(by: bag)
        
        seachBar.rx.text
            .subscribe(onNext: { [unowned self] q in
                self.viewModel.reloadData(query: q!)
                }, onError: { error in
            })
            .disposed(by: bag)
    }
}

extension SearchListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comapanyListValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchListTableViewCell", for: indexPath) as! SearchListTableViewCell
        cell.prepare(res: viewModel.comapanyListValue[indexPath.row])
        return cell
    }
}

