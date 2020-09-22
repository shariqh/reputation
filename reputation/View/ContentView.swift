//
//  ContentView.swift
//  reputation
//
//  Created by Shariq Hirani on 9/21/20.
//

import SwiftUI

struct ContentView: View {
    init() {
        #if DEBUG
        Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")?.load()
        #endif
    }

    var user = "Shariq"
    var timeClassification = "Morning"
    @State var score: Double = 0

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
                        HeadlineView(headlineImage: "news1", headlineText: "wow, updating this text overlaid text headline for this article. I hope that it wraps.")
                        HeadlineView(headlineImage: "news2", headlineText: "overlaid text headline for this article. I hope that it wraps even more.")
                        HeadlineView(headlineImage: "news3", headlineText: "overlaid text headline for this article. I hope that it wraps. But what happens when it's wrapped way too much? Is this even a legitimate fear? overlaid text headline for this article. I hope that it wraps. But what happens when it's wrapped way too much? Is this even a legitimate fear? overlaid text headline for this article. I hope that it wraps. But what happens when it's wrapped way too much? Is this even a legitimate fear?")
                        HeadlineView(headlineImage: "news4", headlineText: "WoW auto truncating text thanks Steve")
                    }
                }
                HStack {
                    Image("donkey")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    Slider(value: $score, in: -1000...1000, step: 1.0)
                    Image("elephant")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                }
            }
        }.padding()
    }
}

//struct HeadlineView: View {
//    var headlineImage: String
//    var headlineText: String
//
//    var body: some View {
//        Image(headlineImage)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 300, height: 200)
//                .clipped()
//                .cornerRadius(5)
//                .overlay(Text(headlineText)
//                        .font(.headline)
//                        .background(Color.black.opacity(0.5))
//                        .foregroundColor(.white)
//                        .padding(5),
//                        alignment: .bottom
//                )
//    }
//}

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
