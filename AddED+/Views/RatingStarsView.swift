//
//  RatingStarsView.swift
//  AddED+
//
//  Created by 3 GO Gantz on 7/18/24.
//

import SwiftUI

struct RatingStarsView: View {
    
    @State var programRating: Program
    var test: Double
    var isReview: Bool
    
    var body: some View {
        
        
        HStack {
            
            
            if test >= 4.5 {
                Image(systemName:"star.fill")
                Image(systemName:"star.fill")
                Image(systemName:"star.fill")
                Image(systemName:"star.fill")
                Image(systemName:"star.fill")
            }
            else if test >= 3.5 {
                Image(systemName:"star.fill")
                Image(systemName:"star.fill")
                Image(systemName:"star.fill")
                Image(systemName:"star.fill")
                Image(systemName:"star")
                
            }
            else if test >= 2.5 {
                Image(systemName:"star.fill")
                Image(systemName:"star.fill")
                Image(systemName:"star.fill")
                Image(systemName:"star")
                Image(systemName:"star")
            }
            else if test >= 1.5 {
                Image(systemName:"star.fill")
                Image(systemName:"star.fill")
                Image(systemName:"star")
                Image(systemName:"star")
                Image(systemName:"star")
            }
            else if test >= 0.5 {
                Image(systemName:"star.fill")
                Image(systemName:"star")
                Image(systemName:"star")
                Image(systemName:"star")
                Image(systemName:"star")
            }
            else {
                Image(systemName:"star")
                Image(systemName:"star")
                Image(systemName:"star")
                Image(systemName:"star")
                Image(systemName:"star")
                
            }
        }
        
    }
    
}

#Preview {
    RatingStarsView(programRating: ECCChicago, test: 3.7, isReview: false)
}
