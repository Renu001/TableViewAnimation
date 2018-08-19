//
//  ViewController.swift
//  TableViewAnimation
//
//  Created by renu on 04/08/18.
//  Copyright © 2018 renu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tableViewToScroll: UITableView!
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableViewToScroll.estimatedRowHeight = 50
        tableViewToScroll.contentInset = UIEdgeInsetsMake(427, 0, 0, 0)
        tableViewToScroll.backgroundColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView Delegate Methods

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        if indexPath.row == 0 {
            
            cell.titleLabel.text = "TitleHeader"
            cell.contentView.backgroundColor = UIColor.darkGray
        }
        else{
            cell.contentView.backgroundColor = UIColor.white
            cell.titleLabel.text = "This is the tableview animation."
            cell.titleLabel.textColor = .black
        }
        return cell
    }
    
    // MARK: - ScrollView Method

    /**
     scrollView function to check the height of the tableView with respect to the height of the TopView ,after scrolling
     **/
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let y = 427 - (scrollView.contentOffset.y + 427)
        let height = min(max(y,60), 540)
        topView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }

}

