//
//  MaoViewContainer.swift
//  Bad Strips
//
//  Created by Константин Емельянов on 14.01.2020.
//  Copyright © 2020 Константин Емельянов. All rights reserved.
//

import SwiftUI
import MapKit

struct MaoViewContainer: View {
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()

    var body: some View {
        ZStack {
            MapView(centerCoordinate: $centerCoordinate, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let newLocation = MKPointAnnotation()
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)
                        print(self.locations)                        
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
    }
}

struct MaoViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        MaoViewContainer()
    }
}
