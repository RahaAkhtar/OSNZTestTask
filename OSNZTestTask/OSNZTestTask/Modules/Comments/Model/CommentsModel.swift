//
//  CommentsModel.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import Foundation

// MARK: - PostCommentModelElement
struct PostCommentModelElement: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias PostCommentModel = [PostCommentModelElement]
