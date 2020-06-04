//
//  UserStore.swift
//  DesignCodeSwiftUI
//
//  Created by Vinicius Carvalho Marques on 04/06/20.
//  Copyright © 2020 Vinicius Carvalho. All rights reserved.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
    @Published var isLogged = false
    @Published var showLogin = false
}
