//
//  MoreVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/17/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit
import MessageUI

class MoreVC: CustomNavibar, UITableViewDelegate, UITableViewDataSource , MFMailComposeViewControllerDelegate{

    @IBOutlet weak var tableView: UITableView!
    var arrayImg: [String] = []
    var arrayText: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: "CustomMoreCell", bundle: nil), forCellReuseIdentifier: "CustomMoreCell")
        arrayImg = ["video.png", "image.png", "tour.png", "ranking.png", "h2h.png", "share.png", "information.png"]
        arrayText = ["Video", "Photo", "Tournaments", "Ranking", "Head to head", "Share this app", "About"]
        
        tableView.separatorStyle = .none
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayImg.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomMoreCell", for: indexPath as IndexPath) as! CustomMoreCell
        cell.lblMore.text = arrayText[indexPath.row]
        cell.imgMore.image = UIImage(named: arrayImg[indexPath.row])
        cell.selectionStyle = UITableViewCellSelectionStyle.default
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            video()
            break
        case 1:
            photo()
            break
        case 2:
            tour()
            break
        case 3:
            ranking()
            break
        case 4:
            h2h()
            break
        case 5:
            share()
            break
        case 6:
            about()
            break
        default:
            break
        }
    }
    
    func video() -> Void {
        let video = VideoVC(nibName: "VideoVC", bundle: nil)
        self.navigationController?.pushViewController(video, animated: true)
    }
    func photo(){
        let photo = PhotoVC(nibName: "PhotoVC", bundle: nil)
        self.navigationController?.pushViewController(photo, animated: true)
    }
    func tour(){
        let tour = TourVC(nibName: "TourVC", bundle: nil)
        self.navigationController?.pushViewController(tour, animated: true)
    }
    func ranking(){
        let ranking = RankingVC(nibName: "RankingVC", bundle: nil)
        self.navigationController?.pushViewController(ranking, animated: true)
    }
    func h2h(){
        let h2h = H2HVC(nibName: "H2HVC", bundle: nil)
        self.navigationController?.pushViewController(h2h, animated: true)
    }
    func share() -> Void {
        Utils.showProgress(self.view)
        SocialHelper.shareOnFacebook(viewController: self, title: "Link App", linkURL: "https://andyhustech.blogspot.com/2017/03/atp-tennis-app-2017-o-tot-nghiep.html")
        Utils.hideProgress(self.view)

    }
    func about(){
        let about = AboutVC(nibName: "AboutVC", bundle: nil)
        self.navigationController?.pushViewController(about, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
}
