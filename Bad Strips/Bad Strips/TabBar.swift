//
//  TabBar.swift
//  Bad Strips
//
//  Created by Константин Емельянов on 06.12.2019.
//  Copyright © 2019 Константин Емельянов. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    //    @State var Price = false
    @Binding var isNavigationBarHidden: Bool
    @Binding var active: Bool
    var body: some View {
        TabView() {
            MainView(active: self.$active, isNavigationBarHidden: self.$isNavigationBarHidden).tabItem({
                
                VStack {
                    Image(systemName: "clock")
                    Text("Organization")
                }
            }).tag(1)
            
            
            PriceView().tabItem({
                
                VStack {
                    Image(systemName: "creditcard")
                    Text("Price")
                }
                
            }).tag(2)
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(isNavigationBarHidden: ContentView().$show, active: ContentView().$show)
    }
}
