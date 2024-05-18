//
//  ContextView.swift
//  HTAView
//
//  Created by CharlieCat on 18. 05. 2024.
//

import SwiftUI
import WebView

struct ContextView: View {
    
    var path: URL
    
    @StateObject var webViewStore = WebViewStore()
    
    var body: some View {
        
        
        WebView(webView: webViewStore.webView)
            .onAppear {
                
                let html = try? String(contentsOf: path)
                print(html!)
                webViewStore.webView.loadHTMLString(html!, baseURL: path)
                webViewStore.webView.evaluateJavaScript("window.resizeTo = (x, y) => { document.innerText += `x: ${x}, y: ${y}` }") { (result, error) in
                    if error == nil {
                        print(result)
                    }
                }
                
            }
        
        
    }
}

