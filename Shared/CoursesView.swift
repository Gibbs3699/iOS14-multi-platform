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
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(courses) { item in
                        CourseItem(course: item)
                            //matchedGeometryEffect only on iOS 14
                            //share animate between 2 views
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame(width: 335, height: 250)
                    }

                }
                .frame(maxWidth: .infinity)
            }
            if show {
                ScrollView {
                    CourseItem(course: courses[0])
                        .matchedGeometryEffect(id: courses[0].id, in: namespace)
                        .frame(height: 300)
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
        .onTapGesture {
            //adding withAnimation won't lag
            withAnimation(.spring()) {
                show.toggle()
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
