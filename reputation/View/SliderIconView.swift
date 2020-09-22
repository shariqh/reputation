//
// Created by Shariq Hirani on 9/21/20.
//

import SwiftUI

struct SliderIconView: View {

    var sliderIcon: String

    var body: some View {
        Image(sliderIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
    }
}

class SliderIconView_Previews: PreviewProvider {
    static var previews: some View {
        SliderIconView(sliderIcon: "donkey")
    }

    #if DEBUG
    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
                UIHostingController(rootView: SliderIconView(sliderIcon: "donkey"))
    }
    #endif
}