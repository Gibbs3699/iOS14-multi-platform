//
//  Sidebar.swift
//  iOS14-multi-platform
//
//  Created by admin on 24/1/2565 BE.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            #if os(iOS)
            content
                .navigationTitle("Learn")
            #else
            content
                //should use only with macOS
                .frame(minWidth: 200, idealWidth: 250, maxHeight: 300)
            #endif
            CoursesView()
            
        }
    }
    var content: some View {
        List {
            NavigationLink(
                destination: CoursesView()){
                Label("Tittle1", systemImage: "book.closed")
            }
            Label("Tittle2", systemImage: "list.bullet.rectangle")
            Label("Tittle3", systemImage: "tv")
            Label("Tittle4", systemImage: "mail.stack")
            Label("Tittle5", systemImage: "magnifyingglass")
        }
        .listStyle(SidebarListStyle())
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
