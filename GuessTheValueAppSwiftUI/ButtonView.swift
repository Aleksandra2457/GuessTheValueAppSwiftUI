//
//  ButtonView.swift
//  GuessTheValueAppSwiftUI
//
//  Created by Александра Лесовская on 23.05.2022.
//

import SwiftUI

struct ButtonView: View {
    
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Text", action: {})
    }
}
