//
//  TagListView.swift
//  AddED+
//
//  Created by 6 GO Gantz on 7/24/24.
//

import SwiftUI

struct TagListView: View {
    @State var usedTag: Tag
    var body: some View {
        ZStack {
            Rectangle()
                .fill(usedTag.getTypeColor())
                .frame(width:UIScreen.main.bounds.width - 20, height:50)
            HStack {
                Text(usedTag.name)
                    .foregroundColor(.white)
                    .font(.system(size:20))
                    .padding(.leading, 10)
                Spacer()
                Image(systemName:"minus.circle")
                    .foregroundColor(.white)
                    .font(.system(size:20))
                    .padding(.trailing, 10)
            }
        }
    }
}

#Preview {
    List {
        TagListView(usedTag: technologyTag)
        TagListView(usedTag: paidTag)
    }
    
}
