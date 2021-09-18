//
//  CommentsViewController.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var postResponseModelElement: PostResponseModelElement!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        self.decorateUI()
    }
    
    func decorateUI() {
        
        tableView.tableFooterView = UIView.init(frame: .zero)
        self.tableView.separatorColor = UIColor.clear
        tableView.register(UINib(nibName: CommentTableViewCell.className, bundle: nil), forCellReuseIdentifier: CommentTableViewCell.className)
        
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }

}
