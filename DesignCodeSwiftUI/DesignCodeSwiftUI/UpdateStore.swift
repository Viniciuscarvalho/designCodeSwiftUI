//
//  UpdateStore.swift
//  DesignCodeSwiftUI
//
//  Created by Vinicius Carvalho Marques on 02/04/20.
//  Copyright © 2020 Vinicius Carvalho. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
