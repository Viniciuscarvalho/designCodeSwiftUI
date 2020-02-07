//
//  ContentView.swift
//  DesignCodeSwiftUI
//
//  Created by Vinicius Carvalho Marques on 05/02/20.
//  Copyright © 2020 Vinicius Carvalho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text("UI Design")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Certificate")
                .foregroundColor(Color("accent"))
            }
            Image("Logo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
