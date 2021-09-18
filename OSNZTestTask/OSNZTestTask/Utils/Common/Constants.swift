//
//  Constants.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import Foundation
import UIKit

//MARK: - STORYBOARDS
struct Storyboards {
    static let MAIN     = UIStoryboard(name: "Main", bundle: nil)
}

//MARK: - Colors

struct Colors {
    
    static let Green_order_Setting_COLOR:UIColor  = UIColor.init(red: 44/255, green:  103/255, blue: 34/255, alpha: 1.0)
    
    let WHITE_COLOR = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let APP_COLOR:UIColor  = UIColor.init(red: 238/255, green:  120/255, blue: 108/255, alpha: 1.0)
}

struct Fonts {
    
    static let ROBOTO_LIGHT_08    = UIFont(name: "Roboto-Light", size: 8)
    static let ROBOTO_LIGHT_10    = UIFont(name: "Roboto-Light", size: 10)
    static let ROBOTO_LIGHT_12    = UIFont(name: "Roboto-Light", size: 12)
    static let ROBOTO_LIGHT_14    = UIFont(name: "Roboto-Light", size: 14)
    static let ROBOTO_LIGHT_16    = UIFont(name: "Roboto-Light", size: 16)
    
}

struct NavigationBarTitle {
    static let kPostTitle               = "Posts"
    static let kCommentsTitle            = "Comments"
}


struct TableviewCells {
    //static let kRememberMeTableViewCell = "idRememberMeTableViewCell"
}

struct UINavBar {
    static let barButtonAppearance = UIBarButtonItem.appearance()
}

struct DateFormat {
    static let kDate = "dd-MMMM-yyyy"
}

