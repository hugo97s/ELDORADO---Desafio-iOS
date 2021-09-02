//
//  Repositorio.swift
//  Desafio-iOS
//
//  Created by Hugo Santos on 01/09/21.
//

import Foundation

    struct RepositoryResponse: Decodable {
        let total_count: String
        let incomplete_results: Bool
        let items: Repositories
    }

    struct Repositories: Decodable {
        let repositorios: [Items]
    }

    struct Items: Decodable {
        let id: String
        let node_id: String
        let name: String
        let full_name: String
        let owner: OwnerDetail
    }

    struct OwnerDetail: Decodable{
        let login: String
        let url: String
    }

//struct Repositorio: Codable, Identifiable {
//    let id = UUID()
//    var items:[item]
//    var total_count: String
//    var incomplete_results: String
//}
//struct item: Codable, Identifiable{
//    var id: Int
//    var name: String
//    var node_id: String
//    var full_name: String
//}
//
//class Api : ObservableObject{
//    var repositorios = [RepositoryResponse]()
//
//    func loadData(completion:@escaping (Repositorio) -> ()) {
//        guard let url = URL(string: "https://api.github.com/search/repositories?q=language:Swift&sort=stars") else {
//            print("Invalid url...")
//            return
//        }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            print("TESTE DATA")
//            let repositorios = try! JSONDecoder().decode(Repositorio.self, from: data!)
//            print(repositorios)
//            DispatchQueue.main.async {
//                completion(repositorios)
//            }
//        }.resume()
////
////            if error != nil {
////                    print("error")
////                    return
////                }
////                guard let data = data else {
////                    print("No data")
////                    return
////                }
////
////                do {
////                    if let myjson = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? Dictionary<String,Any> {
////                        if let title = myjson["items"] {
////                            print("title: ")
////                            print((title))
////                        }
////                    }
////                } catch {
////                    print("Error parsing JSON: (error)")
////                }
////
////            }
////            .resume()
//
//    }
//}
//
//
