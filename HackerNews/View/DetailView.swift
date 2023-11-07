//
//  DetailView.swift
//  HackerNews
//
//  Created by 김하연 on 11/6/23.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "")
}

struct WebView: UIViewRepresentable {
    let urlString: String?
    
    // UIKit WebView를 생성하고, SwiftUI View로 변환
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}

