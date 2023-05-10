//
//  APIManager.swift
//  RickAndMortyApp
//
//  Created by Victor Britto e Barros on 09/05/23.
//
import Alamofire

protocol APIManagerProtocol {
    var baseURL: URL { get }
    var headers: HTTPHeaders? { get }
}

extension APIManagerProtocol {
    var headers: HTTPHeaders? { nil }
}

class APIManager {
    
    private let session: Session
    private let baseURL: URL
    
    init(session: Session, baseURL: URL) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func request(endpoint: String,
                 method: HTTPMethod = .get,
                 parameters: Parameters? = nil,
                 encoding: ParameterEncoding = URLEncoding.default,
                 headers: HTTPHeaders? = nil,
                 completion: @escaping (Result<Data, Error>) -> Void) {
        
        let url = baseURL.appendingPathComponent(endpoint)
        
        session.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
