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
    
    var body: some View {
        VStack {
            ScrollView {
                CourseItem(course: course)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height: 300)
                VStack {
                    ForEach(courseSections) { item in
                        CourseRow(item: item)
                    }
                }
                .padding()
            }
        }
        //prevent overlaping
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: 22, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
        //AnyTransition to customize animation
//                .transition(
//                    .asymmetric(insertion:                         AnyTransition.opacity.animation(Animation.spring().delay(0.3)), removal:                         AnyTransition.opacity.animation(Animation.spring())))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseDetail(namespace: namespace)
    }
}
