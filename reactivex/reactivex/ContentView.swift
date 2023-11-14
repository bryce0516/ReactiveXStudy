//
//  ContentView.swift
//  reactivex
//
//  Created by Hye Sung Park on 11/13/23.
//

import SwiftUI

struct ContentView: View {
  
  func onloadimage () -> Void {
    
  }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
          Button(action: {
            
          }, label: {
            Text("onloadimage")
          })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
