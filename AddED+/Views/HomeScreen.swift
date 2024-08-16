//
//  HomeScreen.swift
//  AddED+
//
//  Created by 6 GO Gantz on 7/11/24.
//

import SwiftUI

struct HomeScreen: View {
    @State var jobSearchedValue: String = ""
    @State var foundJobs: [Program] = []
    var body: some View {
        NavigationView{
            VStack {
                //Top green bar
                GreenHeader()
                //Searching bar
                ZStack {
                    //Search bar background
                    Rectangle()
                        .fill(.white)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 40)
                        .cornerRadius(10)
                    //Search bar functionality and button
                    HStack {
                        TextField("Job Search", text: $jobSearchedValue)
                            .padding([.leading, .trailing], 30.0)
                            .frame(alignment:.leading)
                        
                        Button (action: {foundJobs = searchFunction( query:jobSearchedValue)}, label: {
                            Label("", systemImage:"magnifyingglass")
                        })
                        .foregroundColor(.black)
                        .frame(width: 20, height: 20)
                        .padding([.trailing], 30.0)
                    }
                }
                
                //Featured programs title
                HStack {
                    Text("Featured")
                        .bold()
                        .font(.system(size:24))
                        .padding([.leading], 6.0)
                }
                .frame(width: UIScreen.main.bounds.width-20, height: 60, alignment:.leading)
                .background(.white)
                .cornerRadius(8)
                
                //Scroll through all featured programs
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(placeholderFeaturedPrograms) {
                            featuredProgram in
                            NavigationLink(destination:ProgramView(displayedProgram: featuredProgram)) {
                                ProgramCardView(displayedProgram: featuredProgram, areTagsRemovable: false, paddingAmount: 10.0)
                            }
                            
                        }
                    }
                }
                
                //Recommended Programs Title
                HStack {
                    Text("Recommended Programs")
                        .bold()
                        .font(.system(size:24))
                        .padding([.leading], 6.0)
                }
                .frame(width: UIScreen.main.bounds.width-20, height: 60, alignment:.leading)
                .background(.white)
                .cornerRadius(8)
                displayRecommendedPrograms()
            }
            .background(.customBackground)
            .ignoresSafeArea()
        }
    }
}

extension HomeScreen {
    func displayRecommendedPrograms() -> some View {
        ScrollView(.vertical) {
            ForEach(0..<(placeholderPrograms.count)/2, id:\.self) { i in
                ProgramRecommendedView(program1: placeholderPrograms[i*2], program2: placeholderPrograms[i*2+1])
            }
            
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
