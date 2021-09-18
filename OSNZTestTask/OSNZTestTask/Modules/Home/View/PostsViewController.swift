//
//  PostsViewController.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import UIKit

class PostsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = PostsViewModel()
    var postList:[PostResponseModelElement] = [PostResponseModelElement]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        viewModel.getPostApi()
        //viewModel.getPostCommentsApi(postId: "1")
        viewModelBinding()
    }
    
    func viewModelBinding() {
        viewModel.responseComes = { response in
            
            guard let list = response else {
                return
            }
            self.postList = list
            self.reloadData()
        }
        
        viewModel.errorComes = { msg in
            self.alertMessageShow(message: msg?.description ?? "")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        self.decorateUI()
    }
    
    func decorateUI() {
        
        self.title = NavigationBarTitle.kPostTitle
        
        tableView.tableFooterView = UIView.init(frame: .zero)
        self.tableView.separatorColor = UIColor.clear
        tableView.register(UINib(nibName: PostTableViewCell.className, bundle: nil), forCellReuseIdentifier: PostTableViewCell.className)
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }

}
