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
            CourseItem()
                //matchedGeometryEffect only on iOS 14
                //share animate between 2 views
                .matchedGeometryEffect(id: "Card", in: namespace, isSource: !show)
                .frame(width: 335, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                if show {
                    ScrollView {
                        CourseItem()
                            .matchedGeometryEffect(id: "Card", in: namespace)
                            .frame(height: 300)
                        VStack {
                            ForEach(0 ..< 20) { item in
                                CourseRow()
                            }
                        }
                        .padding()
                    }
                    .transition(.opacity)
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
