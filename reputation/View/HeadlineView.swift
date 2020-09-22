//
// Created by Shariq Hirani on 9/21/20.
//

import SwiftUI

struct HeadlineView: View {
    var headlineImage: String
    var headlineText: String

    var body: some View {
        Image(headlineImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200)
                .clipped()
                .cornerRadius(5)
                .overlay(Text(headlineText)
                        .font(.headline)
                        .background(Color.black.opacity(0.5))
                        .foregroundColor(.white)
                        .padding(5),
                        alignment: .bottom
                )
    }
}


class HeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineView(headlineImage: "news1", headlineText: "sometext")
    }

    #if DEBUG
    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
                UIHostingController(rootView: HeadlineView(headlineImage: "news1", headlineText: "sometext"))
    }
    #endif
}