//
//  CourseItem.swift
//  iOS14-multi-platform
//
//  Created by admin on 25/1/2565 BE.
//

import SwiftUI

struct CourseItem: View {
    //default value to 0
    var course: Course = courses[0]
    #if os(iOS)
    var cornerRadius : CGFloat = 22
    #else
    var cornerRadius : CGFloat = 10
    #endif
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Spacer()
            
            HStack {
                HStack {
                    Spacer()
                    Image(course.image)
                        //use all available space
                        .renderingMode(.original)
                        .resizable()
                        //make images fit on screen size
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200)
                    Spacer()
                }
            }
            
            Text(course.title)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
            Text(course.subtitle)
                .font(.footnote)
                .foregroundColor(Color.white)
        }
        .padding(.all)
        .background(course.color)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        .shadow(color: course.color.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem()
    }
}
