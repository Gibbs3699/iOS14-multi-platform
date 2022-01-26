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
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    var body: some View {
        ZStack {
            ScrollView {
                //LazyVGrid only in iOS14++
                //GridItem() is a grid column, can customize
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)], spacing: 16) {
                    ForEach(courses) { item in
                        CourseItem(course: item)
                            //matchedGeometryEffect only on iOS 14
                            //share animate between 2 views
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame(height: 200)
                            .onTapGesture {
                                //adding withAnimation won't lag
                                withAnimation(.spring()) {
                                    show.toggle()
                                    selectedItem = item
                                    isDisabled = true
                                }
                            }
                            .disabled(isDisabled)
                    }

                }
                .padding(16)
                .frame(maxWidth: .infinity)
            }
            if selectedItem != nil {
                ScrollView {
                    CourseItem(course: selectedItem!)
                        .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                        .frame(height: 300)
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
                    VStack {
                        ForEach(0 ..< 20) { item in
                            CourseRow()
                        }
                    }
                    .padding()
                }
                //prevent overlaping
                .background(Color("Background 1"))
                //AnyTransition to customize animation
                .transition(
                    .asymmetric(insertion:                         AnyTransition.opacity.animation(Animation.spring().delay(0.3)), removal:                         AnyTransition.opacity.animation(Animation.spring())))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    //bring to front
//                        .zIndex(1)
            }
        }
        //adding animation will lag
        // simple fade in/out
//        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
