//
//  Router.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import UIKit

class Router {

static let shared = Router()
    
    func openCommentsViewController(obj:PostResponseModelElement, controller: UIViewController) -> Void {
        let control = Storyboards.MAIN.instantiateViewController(withIdentifier: CommentsViewController.className) as! CommentsViewController
        control.postResponseModelElement = obj
        controller.navigationController?.pushViewController(control, animated: false)
    }
    
}
