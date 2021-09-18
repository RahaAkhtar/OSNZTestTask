//
//  CommentsControllerExtension.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import Foundation

import Foundation
import UIKit

extension CommentsViewController : UITableViewDataSource, UITableViewDelegate
{
    // MARK: - Table view datasource method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.className, for: indexPath) as! CommentTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
        
        //let obj = self.listEventArray[indexPath.row]
        //Router.shared.openProfileDetailViewController(controller: self, selectedObj: obj)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 60
    }
    
}
