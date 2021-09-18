//
//  PostExtension.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import Foundation

import Foundation
import UIKit

extension PostsViewController : UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating
{
    
    
    // MARK: - Table view datasource method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.className, for: indexPath) as! PostTableViewCell
        cell.selectionStyle = .none
        cell.configurCell(obj: self.filteredData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let obj = self.filteredData[indexPath.row]
        Router.shared.openCommentsViewController(obj: obj, controller: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return UITableView.automaticDimension
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            if searchText.isEmpty {
                self.filteredData = self.postList
            } else {
                self.filteredData = self.postList.filter({$0.title!.lowercased().range(of: searchText.lowercased()) != nil})
            }
            tableView.reloadData()
        }
    }
    
}
