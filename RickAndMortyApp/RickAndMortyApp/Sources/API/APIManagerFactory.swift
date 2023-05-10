//
//  APIManagerFactory.swift
//  RickAndMortyApp
//
//  Created by Victor Britto e Barros on 09/05/23.
//

import Alamofire

class APIManagerFactory: APIManagerProvider {
    
    private let baseURL: URL
    private let session: Session
    
    init(){
        let baseURLString = Bundle.main.infoDictionary?["API_BASE_URL"] as? String ?? ""
        self.baseURL = URL(string: baseURLString)!
        self.session = Session()
    }
    
    init(baseURL: URL, session: Session) {
        self.baseURL = baseURL
        self.session = session
    }
    
    func apiManager() -> APIManager {
        return APIManager(session: session, baseURL: baseURL)
    }
}
