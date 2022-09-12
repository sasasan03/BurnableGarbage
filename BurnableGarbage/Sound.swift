//
//  Sound.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/09/11.
//グローバルで呼んでいる。これはグローバル。　グローバルとクラスの違い。
//グローバルの範囲ならどこでも呼べる。クラスにするためには？
import Foundation
import SwiftUI
import AVFoundation

    private let Correct = try! AVAudioPlayer(data: NSDataAsset(name: "correct")!.data)
    private let Wrong = try! AVAudioPlayer(data: NSDataAsset(name: "wrong")!.data)

    public func playSoundCorrect(){
        Correct.stop()
        Correct.currentTime = 0.0
        Correct.play()
    }
    public func playSoundWrong(){
        Wrong.stop()
        Wrong.currentTime = 0.0
        Wrong.play()
    }


