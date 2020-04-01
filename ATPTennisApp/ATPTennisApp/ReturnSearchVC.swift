//
//  ReturnSearchVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 5/16/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit
import MBProgressHUD

class ReturnSearchVC: CustomNavibar, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var nameList: [String] = []
    var nameSearchingList: [String] = []
    
    var isSearching: Bool = false
    var rtService: ReturnService?
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.placeholder = "Search here..."
        customNavigationBar()
        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        getPlayerNameFromServer()
    }
    
    func getPlayerNameFromServer(){
        if rtService == nil {
            rtService = ReturnService()
        }
        Utils.showProgress(self.tableView)
        rtService?.requestReturnFromServer({ (result, object) in
            self.nameList = ((self.rtService?.listName)?.sorted())!
            Utils.hideProgress(self.tableView)
            self.tableView.reloadData()
        })
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching == true{
            return self.nameSearchingList.count
        }
        else{
            return self.nameList.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        if isSearching == true
        {
            cell.textLabel?.text = nameSearchingList[indexPath.row]
        }
        else{
            cell.textLabel?.text = nameList[indexPath.row]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let returnDetailVC = ReturnDetailVC(nibName: "ReturnDetailVC", bundle: nil)
        if isSearching == true {
            for object in (rtService?.listReturnService)! {
                let playerName = nameSearchingList[indexPath.row]
                let ob = object as! ReturnModel
                if ob.name == playerName {
                    returnDetailVC.objectModel = ob
                    break
                }
            }
            
        }
        else{
            for object in (rtService?.listReturnService)! {
                let playerName = nameList[indexPath.row]
                let ob = object as! ReturnModel
                if ob.name == playerName {
                    returnDetailVC.objectModel = ob
                    break
                }
            }
            
        }
        self.navigationController?.pushViewController(returnDetailVC, animated: true)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if self.searchBar.text!.isEmpty{
            self.isSearching = false
        }
            
        else{
            self.isSearching = true
            
            self.nameSearchingList.removeAll(keepingCapacity: false)
            
            for i in 0..<self.nameList.count {
                
                let item: String = self.nameList[i]
                if item.lowercased().range(of: ((self.searchBar.text?.lowercased())!)) != nil{
                    self.nameSearchingList.append(item)
                }
            }
            self.tableView.reloadData()
            
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        self.isSearching = false
        self.searchBar.resignFirstResponder()
        
        self.tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
