//
//  NetworkManager.swift
//  HackerNews
//
//  Created by 김하연 on 11/6/23.
//

import Foundation
// protocol ObservableObject - 해당 클래스는 property 값이 바뀌는지 추적될 수 있음
class NetworkManager: ObservableObject {
    
    // @Published  - ObservableObject에 의해 관찰 될 property
    @Published var posts = [Posts]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        
                        do{
                            let result = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                // @Published를 사용할 때 비동기로
                                self.posts = result.hits
                            }
                        } catch{
                            print("here!!!", error)
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
}
