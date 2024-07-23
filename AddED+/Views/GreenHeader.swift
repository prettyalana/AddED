//
//  GreenHeader.swift
//  AddED+
//
//  Created by Alana Edwards on 7/22/24.
//

import SwiftUI

struct GreenHeader: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.green)
                .frame(width:UIScreen.main.bounds.width, height: 90)
            HStack {
                Image("logo")
                    .resizable()
                    .frame(width:225, height:90)
                Spacer()
            }
        }
    }
}

#Preview {
    GreenHeader()
}
