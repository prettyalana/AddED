//
//  SavedProgramsTab.swift
//  AddED+
//
//  Created by 2 GO Gantz on 7/22/24.
//

import SwiftUI

struct SavedProgramsTab: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    GreenHeader()
                }
                HStack {
                    NavigationLink(destination:HomeScreen()){
                    label:do {Image(systemName: "arrowshape.backward.fill")
                        .foregroundColor(.black)}}
                        Spacer()
                        Text("Saved")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .frame(alignment: .top)
                        Spacer()
                }
                .padding()
                        ScrollView {
                            VStack {
                                ForEach(placeholderFeaturedPrograms) {
                                    featuredProgram in
                                    ProgramCardView(displayedProgram: featuredProgram, areTagsRemovable: false, paddingAmount: 20.0)
                                }
                            }
                    }
                    .ignoresSafeArea()
                }
            }
        }
        .background(.customBackground)
        .ignoresSafeArea()
    }
}


#Preview {
    SavedProgramsTab()
}
