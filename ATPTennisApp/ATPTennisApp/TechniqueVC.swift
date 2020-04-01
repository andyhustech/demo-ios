//
//  TechniqueVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 5/7/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit
import MessageUI

class TechniqueVC: CustomNavibar, UITableViewDelegate, UITableViewDataSource , MFMailComposeViewControllerDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var arrayImg: [String] = []
    var arrayText: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: "CustomMoreCell", bundle: nil), forCellReuseIdentifier: "CustomMoreCell")
        arrayImg = ["backhand.png", "forehand.png", "serve.png", "slice.png", "return.png"]
        arrayText = ["Backhand", "Forehand", "Serve", "Slice", "Returnstance"]
        
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
            backhand()
            break
        case 1:
            forehand()
            break
        case 2:
            serve()
            break
        case 3:
            slice()
            break
        case 4:
            returnstance()
            break
        default:
            break
        }
    }
    
    func backhand() -> Void {
        let backhand = BackhandVC(nibName: "BackhandVC", bundle: nil)
        self.navigationController?.pushViewController(backhand, animated: true)
    }
    func forehand(){
        let forehand = ForehandVC(nibName: "ForehandVC", bundle: nil)
        self.navigationController?.pushViewController(forehand, animated: true)
    }
    func serve(){
        let serve = ServeVC(nibName: "ServeVC", bundle: nil)
        self.navigationController?.pushViewController(serve, animated: true)
    }
    func slice(){
        let slice = SliceVC(nibName: "SliceVC", bundle: nil)
        self.navigationController?.pushViewController(slice, animated: true)
    }
    func returnstance(){
        let returnstance = ReturnVC(nibName: "ReturnVC", bundle: nil)
        self.navigationController?.pushViewController(returnstance, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
}
