//
//  ConnectionDispatcher.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation

public enum ConnectionError: Error {
    case badInput
    case noData
    case parseFailed
    case requestFailed
    case invalidURL
    case custom(message: String)
}

public class ConnectionDispatcher: Dispatcher {
    private var environment: ConnectionEnvironment
    private var session: URLSession
    
    required public init(environment: ConnectionEnvironment = EnvironmentType.default.environment) {
        self.environment = environment
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    public func execute(request: Request, completion: @escaping DispatcherCompletion) throws {
        let rq = try prepareURLRequest(for: request)
        let d = session.dataTask(with: rq, completionHandler: { (data, urlResponse, error) in
            self.printResponse(data)
            let response = Response((urlResponse as? HTTPURLResponse, data, error), for: request)
            completion(response)
        })
        d.resume()
    }
    
    private func prepareURLRequest(for request: Request) throws -> URLRequest {
        guard let hostUrl = URL(string: environment.host) else {
            throw ConnectionError.invalidURL
        }
        let completeURL = hostUrl.appendingPathComponent(request.path)
        var urlRequest = URLRequest(url: completeURL)
        
        if let params = request.parameters {
            urlRequest.encodeParameters(parameters: params)
        }
        
        environment.headers.forEach { urlRequest.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
        request.headers?.forEach { urlRequest.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
        urlRequest.httpMethod = request.method.rawValue
        
        return urlRequest
    }
    
    private func printResponse(_ data: Data?) {
        guard let filledData = data else {
            print("EMPTY RESPONSE")
            return
        }
        let jsonResult = try? JSONSerialization.jsonObject(with: filledData, options: JSONSerialization.ReadingOptions.mutableContainers)
        print("DATA: \(jsonResult ?? "EMPTY")")
    }
}

private extension URLRequest {
    private func percentEscapeString(_ string: String) -> String {
        var characterSet = CharacterSet.alphanumerics
        characterSet.insert(charactersIn: "-._* ")
        
        return string
            .addingPercentEncoding(withAllowedCharacters: characterSet)!
            .replacingOccurrences(of: " ", with: "+")
            .replacingOccurrences(of: " ", with: "+", options: [], range: nil)
    }
    
    mutating func encodeParameters(parameters: [String : String]) {
        let parameterArray = parameters.map { (arg) -> String in
            let (key, value) = arg
            return "\(key)=\(self.percentEscapeString(value))"
        }
        
        httpBody = parameterArray.joined(separator: "&").data(using: String.Encoding.utf8)
    }
}
