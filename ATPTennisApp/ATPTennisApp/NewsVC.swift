//
//  NewsVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/17/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit
import SDWebImage
import SVPullToRefresh

class NewsVC: CustomNavibar, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
   
    var newsService: NewsService?
    
    var sectionTitleList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge()
        customNavigationBar()
        setupTableView()
        
        self.tableView.addPullToRefresh(){
        self.getNewsFromServer()
        }
        getNewsFromServer()
        
        tableView.separatorStyle = .none
        
        
    }
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "CustomNewsCell", bundle: nil), forCellReuseIdentifier: "CustomNewsCell")
        self.tableView.register(UINib.init(nibName: "CustomHeaderNewsCell", bundle: nil), forCellReuseIdentifier: "CustomHeaderNewsCell")
    }
    
    func getNewsFromServer(){
        if newsService == nil{
            self.newsService = NewsService()
            
        }
        Utils.showProgress(self.view)
        newsService?.requestNewsFromServer({ (result, object) in
            Utils.hideProgress(self.view)
            for item in (self.newsService?.listLanguage.sorted(by: >))!{
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
        for object in (newsService?.listNewsService)!{
            let ob = object as! NewsModel
            
            if ob.language == sectionTitleList[section]{
                x = x+1
            }
            
        }
        
        return x
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomNewsCell", for: indexPath as IndexPath) as! CustomNewsCell
        
        let listRow = NSMutableArray()
        let titleSection = sectionTitleList[indexPath.section]
        
        for object in (newsService?.listNewsService)!{
            
            let ob = object as! NewsModel
            
            if ob.language == titleSection{
                listRow.add(ob)
                
            }
        }
        
        let objectLanguage = listRow.object(at: indexPath.row) as! NewsModel
        cell.selectionStyle = .default
        
        cell.lblNews.text = objectLanguage.title
        
        cell.imgTennis.sd_setImage(with: URL(string: objectLanguage.imgurl), placeholderImage: UIImage(named: ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let readingNews = ReadingNewsVC(nibName: "ReadingNewsVC", bundle: nil)
        
        let listRow = NSMutableArray()
        let titleSection = sectionTitleList[indexPath.section]
        
        for object in (newsService?.listNewsService)!{
            
            let ob = object as! NewsModel
            
            if ob.language == titleSection{
                listRow.add(ob)
                
            }
            
        }
        readingNews.objectModel = listRow.object(at: indexPath.row) as? NewsModel
        
        self.navigationController?.pushViewController(readingNews, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell:CustomHeaderNewsCell = tableView.dequeueReusableCell(withIdentifier: "CustomHeaderNewsCell") as! CustomHeaderNewsCell
        headerCell.btnLanguage.setTitle(sectionTitleList[section], for: UIControlState())
        return headerCell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
}
