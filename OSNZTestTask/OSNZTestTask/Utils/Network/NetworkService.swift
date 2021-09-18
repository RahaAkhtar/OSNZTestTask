//
//  NetworkService.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import Foundation

enum RequestType:String {
    
    case post = "POST"
    case get = "GET"
}
typealias Parameters = Dictionary<String,Any>
let session = URLSession.shared

class NetworkService {
    
    static let shared = NetworkService()
    
    func fetchData(requestType:RequestType,fromURL urlStr:String,parameters:Dictionary<String,Any>,completionHandler:@escaping (_ error:Error?, _ jsonData:Data?, _ statusCode:Int?)->Void) -> Void {
        
        guard let urlString = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        
        if requestType.rawValue == RequestType.post.rawValue{
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
        }else{
            //request.cachePolicy =  ReachabilityTest.isConnectedToNetwork() ? .useProtocolCachePolicy : .returnCacheDataDontLoad
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            var statusCode : Int?

            if let httpResponse = response as? HTTPURLResponse {
                statusCode = httpResponse.statusCode

                print("statusCode: \(httpResponse.statusCode)")
            
            }
            
            if let error = error{
                completionHandler(error, nil, statusCode)
            }else{
                completionHandler(nil, data, statusCode)
            }
        })
        
        task.resume()
        
    }
    
    func postRequest(fromURL urlStr:String, parameters:Parameters?,completionHandler:@escaping (_ error:Error?, _ jsonData:Data?, _ statusCode:Int?)->Void) {
        
        
        guard let url = URL(string: urlStr) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = generateBoundary()
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let dataBody = createDataBody(withParameters: parameters, boundary: boundary)
        request.httpBody = dataBody
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            
            var statusCode : Int?
            if let httpResponse = response as? HTTPURLResponse {
                statusCode = httpResponse.statusCode
                
                print("statusCode: \(httpResponse.statusCode)")
                
                let stringHeader = HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode)
                print(stringHeader)
            }
            
            if let error = error{
                completionHandler(error, nil, statusCode)
            }else{
                completionHandler(nil, data, statusCode)
            }
        }
        task.resume()
    }
    
    private func generateBoundary() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    private func createDataBody(withParameters params: Parameters?, boundary: String) -> Data {
        
        let lineBreak = "\r\n"
        var body = Data()
        
        if let parameters = params {
            for (key, value) in parameters {
                
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                body.append("\(value)" + "\(lineBreak)")
            }
        }
        
        body.append("--\(boundary)--\(lineBreak)")
        
        return body
    }
}
