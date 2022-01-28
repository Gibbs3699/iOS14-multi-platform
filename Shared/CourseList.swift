//
//  CourseList.swift
//  iOS14-multi-platform
//
//  Created by admin on 25/1/2565 BE.
//

import SwiftUI

struct CourseList: View {
    @ViewBuilder
    var body: some View {
        //for iOS
        #if os(iOS)
        content
            .listStyle(InsetGroupedListStyle())
        #else
        content
            .frame(minWidth: 800, minHeight: 600)
        #endif
    }
    
    var content: some View {
        List(0 ..< 20) { item in
            CourseRow()
//            Spacer()
        }
        .navigationTitle("Title1")
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
