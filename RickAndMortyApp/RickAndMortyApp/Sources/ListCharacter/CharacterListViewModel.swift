//
//  CharacterListViewModel.swift
//  RickAndMortyApp
//
//  Created by Victor Britto e Barros on 09/05/23.
//

import Foundation

class CharacterListViewModel {
    
    var characters: [Character] = []
    var pageInfo: PageInfo?
    
    func fetchCharacters(page: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        let apiManager = APIManagerFactory().apiManager()
        apiManager.request(endpoint: "/character", method: .get, parameters: ["page": page]) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(CharacterListResponse.self, from: data)
                    self.characters = response.results
                    self.pageInfo = response.info
                    completion(.success(()))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
