//
//  SearchView.swift
//  AddED+
//
//  Created by 6 GO Gantz on 7/24/24.
//

import SwiftUI

struct SearchView: View {
    @State var jobSearchedValue: String = ""
    @State var foundJobs: [Program] = []
    var tags: [Tag] = placeholderTags
    var searchResults: [Program] = placeholderPrograms
    
    var body: some View {
        ZStack {
            VStack {
                GreenHeader()
                //Searching bar
                HStack {
                    ZStack {
                        //Search bar background
                        Rectangle()
                            .fill(.white)
                            .frame(width: UIScreen.main.bounds.width - 75, height: 40)
                            .cornerRadius(10)
                        //Search bar functionality and button
                        HStack {
                            TextField("Job Search", text: $jobSearchedValue)
                                .padding(.leading, 30.0)
                                .frame(alignment:.leading)
                            
                            Button (action: {foundJobs = searchFunction( query:jobSearchedValue)}, label: {
                                Label("", systemImage:"magnifyingglass")
                            })
                            .foregroundColor(.black)
                            .frame(width: 20, height: 20)
                            .padding([.trailing], 30.0)
                        }
                    }
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .font(.system(size: 25))
                }
                .padding()
                HStack {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(tags) { tag in
                                TagRectangleView(displayTag: tag, removable: false)
                                    .fixedSize()
                            }
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .padding()
                    }
                }
                ScrollView {
                    ForEach(searchResults) { program in
                        SearchCardView(displayedProgram: program, areTagsRemovable: false,  paddingAmount: 10)
                    }
                }
                .frame(width: UIScreen.main.bounds.width-20, alignment:.leading)
                .cornerRadius(8)
            }
            .ignoresSafeArea()
        }
        .background(.customBackground)
    }
}

#Preview {
    SearchView()
}
