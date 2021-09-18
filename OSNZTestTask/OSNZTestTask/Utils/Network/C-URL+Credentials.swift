//
//  C-URL+Credentials.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import Foundation

struct BaseUrl {
    static let AppURL = "https://jsonplaceholder.typicode.com"
}




struct API {
    
    struct Post {
        var Posts: String {
            return "\(BaseUrl.AppURL)/posts"
        }
        var Comments: String {
            return "\(BaseUrl.AppURL)/comments?postId="
        }
    }
}
