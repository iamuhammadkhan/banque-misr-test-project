//
//  NetworkManager.swift
//  banque-misr-test-project
//
//  Created by Muhammad Khan on 21/3/24.
//

import Foundation
import Combine

protocol NetworkManagerProtocol: AnyObject {
    typealias Headers = [String: Any]
    typealias Parameters = [String: Any]
    func request<T>(
        type: T.Type,
        url: URL,
        httpMethod: HTTPMethod,
        headers: Headers,
        parameters: Parameters?
    ) -> AnyPublisher<T, Error> where T: Decodable
}

final class NetworkManager: NetworkManagerProtocol {
    
    private var cancellables = Set<AnyCancellable>()
    
    func request<T: Decodable>(type: T.Type, url: URL, httpMethod: HTTPMethod, headers: Headers, parameters: Parameters?) -> AnyPublisher<T, Error> {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        
        headers.forEach { (key, value) in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let params = parameters {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

