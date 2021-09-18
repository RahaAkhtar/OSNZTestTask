//
//  Encodable+Extension.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import Foundation

extension Dictionary where Key:ExpressibleByStringLiteral {
    
    func convertToJSONString() -> String{
        var paramStr:String!
        if let theJSONData = try? JSONSerialization.data(withJSONObject: self,options: []) {
            paramStr = String(data: theJSONData,
                              encoding: .utf8)!
        }
        return paramStr
    }
}
