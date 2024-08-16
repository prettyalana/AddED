//
//  UserInterestsView.swift
//  AddED+
//
//  Created by Alana Edwards on 7/22/24.
//

import SwiftUI
//import WrappingHStack

struct UserInterests: View {
    var tags: [Tag] = placeholderTags
    var inputTags: [Tag] = inputTag
    @State private var totalHeight
    = CGFloat.zero
    
    var body: some View {
        VStack {
            HStack {
                GreenHeader()
            }
            .padding(.bottom)
            ScrollView {
                Spacer()
                //Button
                Image("profileImage")
                Text(currentUser.username)
                HStack {
                    Text("My Interests")
                        .bold()
                        .font(.system(size:24))
                        .padding([.leading], 6.0)
                }
                .frame(width: UIScreen.main.bounds.width-20, height: 60, alignment:.leading)
                .background(.white)
                .cornerRadius(8)
                ZStack {
                    ScrollView(.horizontal) {
                        LazyVGrid(columns: [
                            .init(.fixed(120), spacing: 90),
                            .init(.adaptive(
                                minimum: 40), spacing: 60)
                        ]) {
                            ForEach(tags) { tag in
                                TagRectangleView(displayTag: tag, removable: true)
                                    .fixedSize()
                            }
                        }
                        .padding(16)
                    }
                }
                .frame(width: UIScreen.main.bounds.width-20, height: 250, alignment: .topLeading)
                .background(.white)
                .cornerRadius(8)
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(inputTags) { tag in
                            TagRectangleView(displayTag: tag, removable: true)
                                .fixedSize()
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width-20, height:55, alignment: .topLeading)
                ZStack {
                    Rectangle()
                        .fill(.addED)
                        .frame(width:200, height: 70)
                        .cornerRadius(8)
                    Text("Next")
                        .foregroundColor(.white)
                }
            }
        }
        .background(.customBackground)
        .ignoresSafeArea()
    }
    
}

#Preview {
    UserInterests()
}
