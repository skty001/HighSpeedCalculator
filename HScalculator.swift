//
//  HScalculator.swift
//  HighspeedCalculator WatchKit Extension
//
//  Created by skty001 on 2020/09/28.
//

import Foundation
class HScalculator : ObservableObject {
    var calcHS_H : Double
    var calcHS_L : Double
    var calcSS_H : Int
    var calcSS_L : Int
    var userBPM: Double
    var userSS: Double

    init(){
        calcHS_H = 0
        calcHS_L = 0
        calcSS_H = 0
        calcSS_L = 0
        userBPM = 160
        userSS = 550
    }
    
    let HSMulti: [Double] = [0.25, 0.50, 0.75, 1.00, 1.25, 1.50, 1.75, 2.00,
                             2.25, 2.50, 2.75, 3.00, 3.25, 3.50, 3.75, 4.00,
                             4.50, 5.00, 5.50, 6.00, 6.50, 7.00, 7.50, 8.00]
    
    func getSetValue(inputValue:Double, typeBPM:Bool) -> Double {
        if(typeBPM){
            userBPM = inputValue
            calc()
            return userBPM
        }else{
            userSS = inputValue
            calc()
            return userSS
        }
    }
    
    private func calc(){
        var lower_i = -1
        for i in 1 ..< HSMulti.count{
            if( userBPM * HSMulti[i-1] >= userSS){
                lower_i = i-1;
                break;
            }
        }
        if(lower_i == -1){
            lower_i = HSMulti.count - 1
        }else if(lower_i == 0){
            lower_i = 1
        }
        calcHS_H = HSMulti[lower_i]
        calcSS_H = Int(userBPM * HSMulti[lower_i])
        calcHS_L = HSMulti[lower_i-1]
        calcSS_L = Int(userBPM * HSMulti[lower_i-1])
        return
    }
}
