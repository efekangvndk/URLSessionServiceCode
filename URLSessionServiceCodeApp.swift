//
//  URLSessionServiceCodeApp.swift
//  URLSessionServiceCode
//
//  Created by Efekan Güvendik on 28.09.2024.
//

import SwiftUI
import netfox

@main
struct URLSessionServiceCodeApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
                .onAppear{
                    #if DEBUG
                        NFX.sharedInstance().start()
                            #endif
            }
        }
    }
}
