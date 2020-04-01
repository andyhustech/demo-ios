//
//  SliceVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 5/7/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit
import SDWebImage
import SVPullToRefresh

class SliceVC: CustomNavibar, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var sliceService: SliceService?
    var sectionTitleList: [String] = []
    var identifier: String = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge()
        customNavigationBar()
        customNaviSearchButton()
        searchPlayer()
        setupTableView()
        
        self.tableView.addPullToRefresh(){
            self.getSliceFromServer()
        }
        getSliceFromServer()
        
        tableView.separatorStyle = .none
    }
    
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "CustomTechCell", bundle: nil), forCellReuseIdentifier: "CustomTechCell")
    }
    func getSliceFromServer(){
        if sliceService == nil{
            self.sliceService = SliceService()
            
        }
        Utils.showProgress(self.view)
        sliceService?.requestSliceFromServer({ (result, object) in
            Utils.hideProgress(self.view)
            for item in (self.sliceService?.listName.sorted())!{
                if self.sectionTitleList.contains(item) == false{
                    self.sectionTitleList.append(item)
                    self.tableView.reloadData()
                }
                
                
            }
            self.tableView.pullToRefreshView.stopAnimating()
            
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitleList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var x = 0
        for object in (sliceService?.listSliceService)!{
            let ob = object as! SliceModel
            
            if ob.name == sectionTitleList[section]{
                x = x+1
            }
            
        }
        
        return x
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTechCell", for: indexPath as IndexPath) as! CustomTechCell
        
        
        let listRow = NSMutableArray()
        let titleSection = sectionTitleList[indexPath.section]
        
        for object in (sliceService?.listSliceService)!{
            
            let ob = object as! SliceModel
            
            if ob.name == titleSection{
                listRow.add(ob)
                
            }
            
        }
        
        let objectId = listRow.object(at: indexPath.row) as! SliceModel
        cell.selectionStyle = .default
        
        cell.name.text = objectId.name
        
        cell.flag.sd_setImage(with: URL(string: objectId.flag), placeholderImage: UIImage(named: ""))
        cell.avatar.sd_setImage(with: URL(string: objectId.avatar), placeholderImage: UIImage(named: ""))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sliceDetail = SliceDetailVC(nibName: "SliceDetailVC", bundle: nil)
        
        let listRow = NSMutableArray()
        let titleSection = sectionTitleList[indexPath.section]
        
        for object in (sliceService?.listSliceService)!{
            
            let ob = object as! SliceModel
            
            if ob.name == titleSection{
                listRow.add(ob)
                
            }
            
        }
        sliceDetail.objectModel = listRow.object(at: indexPath.row) as? SliceModel
        
        self.navigationController?.pushViewController(sliceDetail, animated: true)
    }
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    func searchPlayer() -> Void {
        self.pressSearch = {(sender: AnyObject) in
            let alert = UIAlertController(title: "Players Search", message: "", preferredStyle: .actionSheet)
            
            let alertName = UIAlertAction(title: "Search by Name", style: .default, handler: { (action: UIAlertAction) in
                
                let searchPlayer = SliceSearchVC(nibName: "SliceSearchVC", bundle: nil)
                
                self.navigationController?.pushViewController(searchPlayer, animated: true)
            })
            
            
            
            let alertCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction) in
                
            })
            alert.addAction(alertName)
            
            alert.addAction(alertCancel)
            
            
            self.present(alert, animated: true, completion: nil)
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
