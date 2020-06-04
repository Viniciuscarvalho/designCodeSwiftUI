//
//  LoadingView.swift
//  DesignCodeSwiftUI
//
//  Created by Vinicius Carvalho Marques on 03/06/20.
//  Copyright © 2020 Vinicius Carvalho. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        LottieView(filename: "loading").frame(width: 200, height: 200)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
