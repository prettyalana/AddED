//
//  ProgramCardView.swift
//  AddED+
//
//  Created by 6 GO Gantz on 7/13/24.
//

import SwiftUI

struct SearchCardView: View {
    @State var displayedProgram: Program
    @State var areTagsRemovable: Bool
    @State var paddingAmount: Double
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(width: 350, height: 130)
                .cornerRadius(10)
                .shadow(color: Color(red: 0.4, green: 0.4, blue: 0.4), radius:5, y:5)
                .padding()
            VStack {
                HStack {
                    Text(displayedProgram.name)
                        .font(.system(size:20))
                        .padding(.trailing, 5)
                    Spacer()
                }
                .frame(maxWidth:300, maxHeight:20)
                .padding([.top, .leading, .bottom], 5)
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(displayedProgram.tags) { tag in
                            TagRectangleView(displayTag: tag, removable: areTagsRemovable, itemTagged: displayedProgram)
                        }
                    }
                }
                .padding(.trailing, 50)
                .frame(maxWidth:300, maxHeight: 20)
                HStack {
                    Image(systemName:"star.fill")
                        .frame(alignment:.trailing)
                        .foregroundColor(.yellow)
                        .font(.system(size:25))
                    Text("(" + String(displayedProgram.ratingsAverageScore()) + ")")
                        .foregroundColor(.yellow)
                        .bold()
                        .font(.system(size: 24))
                    Spacer()
                    if (currentUser.savedPrograms.contains(displayedProgram.id)) {
                        Image(systemName:"bookmark.fill")
                            .foregroundColor(.blue)
                            .font(.system(size:24))
                    }
                    else {
                        Image(systemName: "bookmark")
                            .foregroundColor(.blue)
                            .font(.system(size:24))
                    }
                }
                .padding(.all, 8.0)
                .frame(maxWidth:300)
                
                
            }
        }
    }
}

#Preview {
    SearchCardView(displayedProgram: ECCChicago, areTagsRemovable: false, paddingAmount: 10.0)
}
