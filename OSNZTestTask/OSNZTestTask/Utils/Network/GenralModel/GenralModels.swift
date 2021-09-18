//
//  GenralModels.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import Foundation

struct NotSuccessModel:Codable {
    let isError: Bool
    let message: String?
}

struct CustomError: LocalizedError {
    var description: String?

    init(description: String) {
        self.description = description
    }
}
