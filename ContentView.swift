//
//  ContentView.swift
//  HighspeedCalculator WatchKit Extension
//
//  Created by skty001 on 2020/09/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var hscalc = HScalculator()
    @State var inputBPM : Double = 236
    @State var inputSS : Double = 550
    @State var colorBPM : Color = Color.blue
    @State var colorSS : Color = Color.white
    @State var focusBPM : Bool = true
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                VStack{
                    Text("楽曲BPM").font(.footnote)
                    Button(action:{
                        if(!self.focusBPM){
                            self.colorBPM = Color.blue
                            self.colorSS = Color.white
                            self.focusBPM = true
                        }
                    }){
                        Text(String(format: "%4d", Int(hscalc.getSetValue(inputValue:inputBPM, typeBPM: true)))).font(.title3).foregroundColor(self.colorBPM).focusable().digitalCrownRotation($inputBPM, from:0, through:1040, by:1)
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                Spacer()
                Divider()
                Spacer()
                VStack{
                    Text("目標SS").font(.footnote)
                    Button(action:{
                        if(self.focusBPM){
                            self.colorBPM = Color.white
                            self.colorSS = Color.blue
                            self.focusBPM = false
                        }
                    }){
                        Text(String(format: "%4d", Int(hscalc.getSetValue(inputValue:inputSS, typeBPM: false)))).font(.title3).foregroundColor(self.colorSS).focusable().digitalCrownRotation($inputSS, from:0, through:8320, by:1)
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                Spacer()
            }
            Spacer()
            Divider().background(Color.blue)
            Spacer()
            HStack {
                Spacer()
                Text("× " + String(format: "%.2f", hscalc.calcHS_L)).font(.title2)
                Spacer()
                Text("=")
                Spacer()
                Text(String(format: "%4d", hscalc.calcSS_L)).font(.title2)
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            Spacer()
            HStack {
                Spacer()
                Text("× " + String(format: "%.2f", hscalc.calcHS_H)).font(.title2)
                Spacer()
                Text("=")
                Spacer()
                Text(String(format: "%4d", hscalc.calcSS_H)).font(.title2)
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            Spacer()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
