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
    
    let viewModel = CommentsViewModel()
    var postCommentsList:[PostCommentModelElement] = [PostCommentModelElement]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        self.decorateUI()
        viewModel.getPostCommentsApi(postId: "\(postResponseModelElement.id ?? 1)")
        viewModelBinding()
    }
    
    func viewModelBinding() {
        viewModel.comentsResponseComes = { response in
            
            guard let list = response else {
                return
            }
            self.postCommentsList = list
            self.reloadData()
        }
        
        viewModel.errorComes = { msg in
            self.alertMessageShow(message: msg?.description ?? "")
        }
    }
    
    func decorateUI() {
        self.title = NavigationBarTitle.kCommentsTitle
        tableView.tableFooterView = UIView.init(frame: .zero)
        self.tableView.separatorColor = UIColor.clear
        tableView.register(UINib(nibName: PostTableViewCell.className, bundle: nil), forCellReuseIdentifier: PostTableViewCell.className)
        
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }

}
