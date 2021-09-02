//
//  RequisicaoRepositorio.swift
//  Desafio-iOS
//
//  Created by Hugo Santos on 01/09/21.
//

import Foundation
enum RepositoryError: Error{
    case noDataAvailable
}
class RepositoryRequest {
    @Published var listOfRepositories = [Items]()
    let resourceURL: URL
    init(){
        let resourceString = "https://api.github.com/search/repositories?q=language:Swift&sort=stars"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    func getRepositories(completion:@escaping (Result<[Items], RepositoryError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let repositoryResponse = try decoder.decode(RepositoryResponse.self, from: jsonData)
                let items = repositoryResponse.items.repositorios
                completion(.success(items))
            }catch{
                completion(.failure(.noDataAvailable))
            }
        }
    }
}
