//
//  ContentView.swift
//  Flags
//
//  Created by Aigerim Kenesbek on 30/03/2024.

import SwiftUI
import Combine

class FlagSelectionViewModel: ObservableObject {
    @Published var flagIndex = 0
    let flags = ["🇬🇧", "🇯🇵", "🇷🇺", "🇩🇪", "🇰🇿", "🇺🇸"]

    func changeFlag() {
        flagIndex = (flagIndex + 1) % flags.count
    }
}

struct ContentView: View {
    @ObservedObject var viewModel = FlagSelectionViewModel()

    var body: some View {
        VStack {
            Spacer()

            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.black, lineWidth: 4)
                    .background(Color.white)
                    .frame(width: 120, height: 120)

                Text(viewModel.flags[viewModel.flagIndex])
                    .font(.system(size: 70))
            }

            Spacer()

            Button(action: {
                withAnimation {
                    self.viewModel.changeFlag()
                }
            }) {
                Text("Hit me!")
                    .padding()
                    .frame(minWidth: 150, maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
