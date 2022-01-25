//
//  CoursesView.swift
//  iOS14-multi-platform
//
//  Created by admin on 24/1/2565 BE.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    var body: some View {
        ZStack {
            CourseItem()
                .frame(width: 335, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack{
                if show {
                    CourseItem()
                        .transition(.move(edge: .trailing))
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        //bring to front
//                        .zIndex(1)
                }
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
        // simple fade in/out
//        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
//        .animation(.spring())
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
