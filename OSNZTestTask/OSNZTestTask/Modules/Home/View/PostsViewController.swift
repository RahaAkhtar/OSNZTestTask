//
//  PostsViewController.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import UIKit
import NVActivityIndicatorView

class PostsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = PostsViewModel()
    var postList:[PostResponseModelElement] = [PostResponseModelElement]()
    var filteredData: [PostResponseModelElement]!
    var searchController: UISearchController!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
    }
    
    func viewModelBinding() {
        viewModel.responseComes = { response in
            self.LoadingStop()
            guard let list = response else {
                return
            }
            self.postList = list
            self.filteredData = list
            self.reloadData()
            self.searchConterillerInit()
        }
        
        viewModel.errorComes = { msg in
            self.LoadingStop()
            self.alertMessageShow(message: msg?.description ?? "")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.decorateUI()
        api()
    }
    
    func api()  {
        self.LoadingStart()
        viewModel.getPostApi()
        viewModelBinding()
    }
    
    func decorateUI() {
        
        self.title = NavigationBarTitle.kPostTitle
        
        tableView.tableFooterView = UIView.init(frame: .zero)
        self.tableView.separatorColor = UIColor.clear
        tableView.register(UINib(nibName: PostTableViewCell.className, bundle: nil), forCellReuseIdentifier: PostTableViewCell.className)
    }
    
    func reloadData() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }

    func searchConterillerInit() {
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
    
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
    }
    
}
