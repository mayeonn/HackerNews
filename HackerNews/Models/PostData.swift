//
//  PostData.swift
//  HackerNews
//
//  Created by 김하연 on 11/6/23.
//

import Foundation

struct Results: Decodable {
    let hits: [Posts]
}

struct Posts: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
