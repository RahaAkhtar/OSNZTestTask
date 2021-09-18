//
//  PostsViewModel.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import Foundation

class PostsViewModel {
    
    var responseComes:((PostResponseModel?)->())?
    var errorComes:((CustomError?)->())?
    
    func getPostApi() {
        
        let url = API.Post.init().Posts
        
        APIGeneric<PostResponseModel>.fetchRequest(apiURL: url) { [weak self] (result) in
            DispatchQueue.main.async {

                guard let `self` = self else { return }
                switch result {
                case .success(let responseModel):
                    self.responseComes?(responseModel)
                case .failure(let error):
                    let err = CustomError(description: (error as? CustomError)?.description ?? "")
                    self.errorComes?(err)
                }
            }
        }
    }
    
}
