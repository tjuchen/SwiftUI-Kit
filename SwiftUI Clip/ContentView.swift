//
//  ContentView.swift
//  SwiftUI Clip
//
//  Created by chenyao on 2020/7/16.
//

import SwiftUI

struct ContentView: View {
    
    var list: some View {
        List {
            Grouping(title: "Buttons", icon: "capsule", content: { ButtonsGroup() })
            Grouping(title: "Colors", icon: "paintpalette", content: { ColorsGroup() })
            Grouping(title: "Controls", icon: "slider.horizontal.3", content: { ControlsGroup() })
            Grouping(title: "Fonts", icon: "textformat", content: { FontsGroup() })
            #if os(iOS)
            Grouping(title: "Haptics", icon: "hand.tap", content: { HapticsGroup() })
            #endif
            #if !APPCLIP
            Grouping(title: "Images", icon: "photo", content: { ImagesGroup() })
            Grouping(title: "Indicators", icon: "speedometer", content: { IndicatorsGroup() })
            Grouping(title: "Shapes", icon: "square.on.circle", content: { ShapesGroup() })
            Grouping(title: "Text", icon: "text.aligncenter", content: { TextGroup() })
            #endif
        }
    }
    
    var body: some View {
        NavigationView {
            #if os(iOS) || os(watchOS) || os(tvOS)
            list.navigationBarTitle("SwiftUI")
            Text("Select a group")
            #elseif os(OSX)
            list.listStyle(SidebarListStyle())
            Text("Select a group").frame(maxWidth: .infinity, maxHeight: .infinity)
            #endif
        }
        .accentColor(.accentColor)
    }
}

struct Grouping<Content: View>: View {
    var title: String
    var icon: String
    var content: () -> Content
    
    var body: some View {
        NavigationLink(destination: GroupView(title: title, content: content)) {
            #if os(iOS)
            Label(title, systemImage: icon).font(.headline).padding(.vertical, 8)
            #else
            Label(title, systemImage: icon)
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
