//
//  PriceView.swift
//  Bad Strips
//
//  Created by Константин Емельянов on 05.12.2019.
//  Copyright © 2019 Константин Емельянов. All rights reserved.
//

import SwiftUI

struct PriceView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Вы потратили:")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.leading)
                Spacer()
                Text("Сумма*")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.trailing)
            }
            
            List {
                
                ForEach(0 ..< 5) { item in
                    Text("vvvvv")
                }
               

                
            }
            
        }
    .padding()
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView()
    }
}
