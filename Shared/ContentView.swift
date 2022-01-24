//
//  ContentView.swift
//  Shared
//
//  Created by admin on 23/1/2565 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Spacer()
            
            HStack {
                HStack {
                    Spacer()
                    Image("Illustration 1")
                        //use all available space
                        .resizable()
                        //make images fit on screen size
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
            }
            
            Text("SwiftUI for iOS 14")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
            Text("add content")
                .font(.footnote)
                .foregroundColor(Color.white)
        }
        .padding(.all)
        .background(Color.blue)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .cornerRadius(20.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/))
            .preferredColorScheme(.dark)
    }
}
