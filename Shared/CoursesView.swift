//
//  CoursesView.swift
//  iOS14-multi-platform
//
//  Created by admin on 24/1/2565 BE.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    @Namespace var namespace
    @Namespace var namespace2
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    //to detect large screen size
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    var body: some View {
        ZStack {
            #if os(iOS)
            if horizontalSizeClass == .compact {
                tabBar
            }
            fullContent
                .background(VisualEffectBlur(blurStyle: .systemMaterial).edgesIgnoringSafeArea(.all))
            #else
            content
            fullContent
                .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
            #endif
        }
        .navigationTitle("Courses")
        //adding animation will lag
        // simple fade in/out
        //        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
        
    }
    
    var content: some View {
        ScrollView {
            VStack(spacing: 0) {
//                Text("Courses")
//                    .font(.largeTitle)
//                    .bold()
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(16)
//                    .padding(.top, 54)
                
                //LazyVGrid only in iOS14++
                //GridItem() is a grid column, can customize
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)], spacing: 16) {
                    ForEach(courses) { item in
                        VStack {
                            CourseItem(course: item)
                                //matchedGeometryEffect only on iOS 14
                                //share animate between 2 views
                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                .frame(height: 200)
                                .onTapGesture {
                                    //adding withAnimation won't lag
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
                                        show.toggle()
                                        selectedItem = item
                                        isDisabled = true
                                    }
                                }
                                .disabled(isDisabled)
                        }
                        .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                    }
                    
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                
                Text("Latest sections")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 240))]) {
                    ForEach(courseSections) { item in
                        #if os(iOS)
                        NavigationLink(destination: CourseDetail(namespace: namespace2)) {
                            CourseRow(item: item)
                        }
                        #else
                        CourseRow()
                        #endif
                    }
                }
                .padding()
            }
        }
        .zIndex(1)
        .navigationTitle("Courses")
    }
    
    @ViewBuilder
    var fullContent: some View {
        if selectedItem != nil {
            ZStack(alignment: .topTrailing) {
                CourseDetail(course: selectedItem!, namespace: namespace)
                
                CloseButton()
                    .padding(16)
                    .onTapGesture {
                        //adding withAnimation won't lag
                        withAnimation(.spring()) {
                            show.toggle()
                            selectedItem = nil
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                                isDisabled = false
                            }
                        }
                    }
            }
            //bring to front
            .zIndex(2)
            .frame(maxWidth: 712)
            .frame(maxWidth: .infinity)
        }
    }
    
    var tabBar: some View {
        TabView {
            NavigationView {
                content
            }
            .tabItem {
                Image(systemName: "book.closed")
                Text("Courses")
            }
            
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("Tutorials")
            }
            
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "tv")
                Text("Livestreams")
            }
            
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "mail.stack")
                Text("Certificates")
            }
            
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
        }
    }
    
    @ViewBuilder
    var sideBar : some View {
        #if os(iOS)
        NavigationView {
            List {
                NavigationLink(
                    destination: content){
                    Label("Tittle1", systemImage: "book.closed")
                }
                Label("Tittle2", systemImage: "list.bullet.rectangle")
                Label("Tittle3", systemImage: "tv")
                Label("Tittle4", systemImage: "mail.stack")
                Label("Tittle5", systemImage: "magnifyingglass")
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Learn")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "person.crop.circle")
                }
            }
            
            content
        }
        #endif
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
