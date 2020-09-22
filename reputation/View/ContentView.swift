//
//  ContentView.swift
//  reputation
//
//  Created by Shariq Hirani on 9/21/20.
//

import SwiftUI
import UIKit

struct ContentView: View {
    init() {
        #if DEBUG
        Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")?.load()
        #endif
    }

    var user = "Shariq"
    var timeClassification = "Morning"
    @State var spectrumSliderPosition: Double = 0

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Good \(timeClassification), \(user)")
                        Text("Today's Top Headlines")
                                .font(.title3)
                                .bold()
                    }
                    Spacer()
                    Image(systemName: "person.circle")
                            .font(.largeTitle)
                }
                Capsule()
                        .frame(width: 50, height: 5)
                        .foregroundColor(Color.gray)
                ScrollView(.horizontal) {
                    HStack {
                        HeadlineView(headlineImage: "news1", headlineText: "Updating this text overlaid text headline for this article. I hope that it wraps.")
                        HeadlineView(headlineImage: "news2", headlineText: "overlaid text headline for this article. I hope that it wraps even more.")
                        HeadlineView(headlineImage: "news3", headlineText: "overlaid text headline for this article. I hope that it wraps. But what happens when it's wrapped way too much? Is this even a legitimate fear? overlaid text headline for this article. I hope that it wraps. But what happens when it's wrapped way too much? Is this even a legitimate fear? overlaid text headline for this article. I hope that it wraps. But what happens when it's wrapped way too much? Is this even a legitimate fear?")
                        HeadlineView(headlineImage: "news4", headlineText: "WoW auto truncating text thanks Steve")
                    }.offset(x: -50)
                }
                HStack {
                    SliderIconView(sliderIcon: "donkey")
                    SwiftUISlider(thumbColor: .white, minTrackColor: .lightGray, maxTrackColor: .lightGray, value: $spectrumSliderPosition)
//                    Slider(value: $spectrumSliderPosition, in: -1000...1000).accentColor(Color(.lightGray))
                    SliderIconView(sliderIcon: "elephant")
                }
            }
        }.padding()
    }
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

    #if DEBUG
    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
                UIHostingController(rootView: ContentView())
    }
    #endif
}
