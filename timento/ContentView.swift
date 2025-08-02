//
//  ContentView.swift
//  sei la
//
//  Created by Gustavo Benitez Frehse on 28/07/25.
//

import SwiftUI

enum ChooseType: String {
    case chooseOne = "Escolha um"
    case chooseTwo = "Escolha dois"
    case chooseThree = "Sem escolha"
}

func chooseModel(_ angle: Double) -> ChooseType {
    switch angle {
    case -180..<(-25):
        return .chooseOne
    case (-25)..<25:
        return .chooseThree
    case 25..<180:
        return .chooseTwo
    default:
        fatalError("Range de angulo não reconhecido: \(angle)")
    }
}

struct ContentView: View {
    @StateObject private var motionManager: MotionManager = MotionManager()

    var body: some View {
        NavigationStack {
            // StartView(motionEnabled: motionManager.motionEnabled)
            GameView()
            // EndingView(ending: EndingModel.all[0])
        }
        // VStack{
        //     Text("Testando")

        //     RotationItemView(rotationAngle: motionManager.getYAngle(),
        //                      modelName: "toy_biplane_realistic.usdz")

        //     Text(chooseModel(motionManager.actualAngle).rawValue)

        //     Button("reset") {
        //         motionManager.resetAngle()
        //     }
    }
}
