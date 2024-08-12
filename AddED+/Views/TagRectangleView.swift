//
//  TagRectangleView.swift
//  AddED+
//
//  Created by 6 GO Gantz on 7/13/24.
//

import SwiftUI

struct TagRectangleView: View {
    @State var displayTag: Tag
    @State var removable: Bool
    @State var itemTagged: Program = ECCChicago //Initialize with default
    var body: some View {
        if removable {
            HStack {
                HStack {
                    Text(displayTag.name)
                    Button(action:{itemTagged.removeTag(inputTag: displayTag)}) {
                        Image(systemName:"x.circle")
                    }
                }
                .padding(6.0)
                .background(displayTag.getTypeColor())
                .cornerRadius(8)
                .foregroundColor(.white)
                .padding(.all, 6.0)
                .font(.system(size: 20))
            }
        } else {
            Text(displayTag.name)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.all, 6.0)
                .background(displayTag.getTypeColor())
                .cornerRadius(8)
        }
        
        
    }
}



#Preview {
    TagRectangleView(displayTag: technologyTag, removable: true, itemTagged: ECCChicago)
}
