//
//  CommentsViewModel.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import Foundation

class CommentsViewModel {
    
    var errorComes:((CustomError?)->())?
    var comentsResponseComes:((PostCommentModel?)->())?
    
    func getPostCommentsApi(postId:String) {
        
        let url = API.Post.init().Comments + postId
        APIGeneric<PostCommentModel>.fetchRequest(apiURL: url) { [weak self] (result) in
            DispatchQueue.main.async {
                
                guard let `self` = self else { return }
                switch result {
                case .success(let responseModel):
                    self.comentsResponseComes?(responseModel)
                case .failure(let error):
                    let err = CustomError(description: (error as? CustomError)?.description ?? "")
                    self.errorComes?(err)
                }
            }
        }
    }
}
