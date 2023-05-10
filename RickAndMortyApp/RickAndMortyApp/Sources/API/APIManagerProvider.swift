//
//  APIManagerProvider.swift
//  RickAndMortyApp
//
//  Created by Victor Britto e Barros on 09/05/23.
//

import Foundation

protocol APIManagerProvider {
    func apiManager() -> APIManager
}
