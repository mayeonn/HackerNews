//
//  ContentView.swift
//  HackerNews
//
//  Created by 김하연 on 11/3/23.
//

import SwiftUI

struct ContentView: View {
    // @ObservedObject - 해당 클래스를 추적하여 property가 바뀌면 뷰를 업데이트
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4XOR NEWS")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

#Preview {
    ContentView()
}
