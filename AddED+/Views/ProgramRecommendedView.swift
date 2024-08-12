//
//  ProgramRecommendedView.swift
//  AddED+
//
//  Created by 6 GO Gantz on 7/22/24.
//

import SwiftUI

struct ProgramRecommendedView: View {
    @State var program1: Program
    @State var program2: Program
    var body: some View {
        HStack {
            Spacer()
            NavigationLink(destination:ProgramView(displayedProgram: program1)) {
                ProgramCardView(displayedProgram: program1, areTagsRemovable: false, paddingAmount: 10.0)
                    .frame(width:180, height:140)
            }
            
            Spacer()
            NavigationLink(destination:ProgramView(displayedProgram: program2)) {
                ProgramCardView(displayedProgram: program2, areTagsRemovable: false, paddingAmount: 10.0)
                    .frame(width:180, height:140)
            }
            Spacer()
        }
    }
}

#Preview {
    VStack {
        ProgramRecommendedView(program1: ECCChicago, program2: afterSchoolMatters)
    }
    
}
