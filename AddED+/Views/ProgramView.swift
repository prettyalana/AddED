//
//  ProgramView.swift
//  AddED+
//
//  Created by 3 GO Gantz on 7/18/24.
//

import SwiftUI

struct ProgramView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var displayedProgram: Program
    
    var body: some View {
        ZStack {
            VStack{
                //Top green bar
                GreenHeader()
                ScrollView {
                    HStack{
                        Spacer()
                        Text(displayedProgram.name)
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        Spacer()
                    }
                    
                    VStack {
                        HStack {
                            Image(displayedProgram.imageName)
                                .resizable()
                                .frame(width: 300, height: 200)
                        }
                        
                        RatingStarsView(programRating: ECCChicago, test: 3.7, isReview: false)
                    }
                    
                    HStack {
                        TagRectangleView(displayTag: technologyTag, removable: false, itemTagged: ECCChicago)
                        
                        
                        TagRectangleView(displayTag: paidTag, removable: false, itemTagged: ECCChicago)
                    }
                    .padding(.top)
                    
                    GroupBox(label: Label("Description" , systemImage: "")) {
                        Text(displayedProgram.description)
                    }
                    .frame(width: 300, height: 200)
                    
                    Text("Reviews")
                        .font(.title)
                    
                    ZStack{
                        Rectangle()
                            .fill(.green)
                            .frame(width:350)
                        VStack {
                            ForEach(placeholderRatings){
                                review in
                                RatingView(review: review)
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
        .background(Color(red: 0.8705, green: 0.8705, blue: 0.8705))
    }
}

#Preview {
    ProgramView(displayedProgram: ECCChicago)
}
