//
//  CourseDetail.swift
//  iOS14-multi-platform
//
//  Created by admin on 26/1/2565 BE.
//

import SwiftUI

struct CourseDetail: View {
    var course : Course = courses[0]
    var namespace : Namespace.ID
    #if os(iOS)
    var cornerRadius : CGFloat = 10
    #else
    var cornerRadius : CGFloat = 0
    #endif
    @State var showModal = false
    
    var body: some View {
        #if os(iOS)
        content
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        #else
        content
        #endif
    }
    
    var content: some View {
        VStack {
            ScrollView {
                CourseItem(course: course, cornerRadius: 0)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height: 300)
                VStack {
                    ForEach(courseSections) { item in
                        CourseRow(item: item)
                            .sheet(isPresented: $showModal) {
                                CourseSectionDetail()
                            }
                            .onTapGesture {
                                showModal = true
                            }
                        Divider()
                    }
                }
                .padding()
            }
        }
        //prevent overlaping
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
        //AnyTransition to customize animation
//                .transition(
//                    .asymmetric(insertion:                         AnyTransition.opacity.animation(Animation.spring().delay(0.3)), removal:                         AnyTransition.opacity.animation(Animation.spring())))
    }
}

struct CourseDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseDetail(namespace: namespace)
    }
}
