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
            .navigationTitle("Learn")
            
            CoursesView()
        }
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
