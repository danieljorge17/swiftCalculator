//
//  TotalText.swift
//  first_project
//
//  Created by Daniel Jorge on 22/05/23.
//

import SwiftUI

struct TotalText: View {
    var value: String = "0"
    var body: some View {
        Text(value)
            .font(.system(size: 60))
            .padding()
            .foregroundColor(.white)
    }
}

struct TotalText_Previews: PreviewProvider {
    static var previews: some View {
        TotalText().background(.black)
    }
}
