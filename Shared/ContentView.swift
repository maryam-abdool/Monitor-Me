//
//  ContentView.swift
//  Shared
//
//  Created by Maryam Abdool on 4/23/22.
//

import SwiftUI
import CoreMotion

import Foundation
import Combine

/*struct HomeView: View {
    
    @ObservedObject var motion: MotionManager
    
    @State var playerPaused = true
    
    @State var showView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background2")
                    .resizable()
                    .aspectRatio(UIImage(named:"background")!.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("title").scaleEffect(1.2).padding(.bottom, 90)
                    Button(action: {
                        self.playerPaused.toggle()
                        if !(self.playerPaused) {
                            self.showView = true
                        }
                        
                    }) {
                        VStack {
                            Image(playerPaused ? "t0" : "t2").renderingMode(.original).scaleEffect(1.2).padding(.bottom, 20)

                            Image(playerPaused ? "play" : "pause").renderingMode(.original).scaleEffect(1.7).padding(.all, 50)
                            
                            Image(playerPaused ? "s00" : "s2").renderingMode(.original).scaleEffect(1.3).padding(.bottom, 8)
                        }
                    }
                    NavigationLink(destination: MonitorView(), isActive: $showView) {
                        EmptyView()
                    }
                }.padding(.bottom)
            }
        }
    }
}*/
struct ContentView: View {
    @ObservedObject var motion: MotionManager
    
    @State var playerPaused = true
    
    @State var showView = false
    
    @State private var hasTimeElapsed = false
    
    @State var list_time:[Date] = []
    
    @State var date_t: Date = Date()

    
    var body: some View {

        NavigationView {
            ZStack {
                Image("background2")
                    .resizable()
                    .aspectRatio(UIImage(named:"background")!.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {

                    Image("title").scaleEffect(1.2).padding(.bottom, 90)
                    Button(action: {
                        self.playerPaused.toggle()
                        if !(self.playerPaused) {
                            self.showView = true
                        }
                        
                    }) {
                        VStack {
                            Image(playerPaused ? "t0" : "t1").renderingMode(.original).scaleEffect(1.2).padding(.bottom, 20)

                            Image(playerPaused ? "play" : "pause").renderingMode(.original).scaleEffect(1.7).padding(.all, 50)
                            
                            if !(self.playerPaused) {
                                
                                if (motion.pitch >= 0 || motion.roll >= 0 || motion.yaw >= 0) {

                                    VStack {
                                        
                                        
                                        Image("instr").renderingMode(.original).scaleEffect(1.3).padding(.bottom, 8).onAppear {
                                            /*let startingPoint = Date()
                                            print("\(startingPoint.timeIntervalSinceNow * -1) seconds elapsed")*/
                                            usleep(5000000)
                                            self.date_t = Date()

                                        }
                                        
                                        Text(self.date_t, style: .time)
                                                .font(.largeTitle)
                                                .frame(width: 300)
                                                .foregroundColor(.red)
                                                .padding(.bottom, 8)
                                        
                                    }
                                    
                                } else {
                                    VStack {
                                        
                                        
                                    Image("instr").renderingMode(.original).scaleEffect(1.3).padding(.bottom, 8)
                                        
                                    Text(self.date_t, style: .time)
                                        .font(.largeTitle)
                                        .frame(width: 300)
                                        .foregroundColor(.red)
                                        .padding(.bottom, 8)

                                    }
                                }
                            } else {
                                VStack {
                                
                                    
                                Image("instr").renderingMode(.original).scaleEffect(1.3).padding(.bottom, 8)
                                    
                                Text(self.date_t, style: .time)
                                    .font(.largeTitle)
                                    .frame(width: 300)
                                    .foregroundColor(.green)
                                    .opacity(0)
                                    .padding(.bottom, 8)

                                }
                            }
                        }
                    }
                    
                }.padding(.bottom)
            }
        }
    }
    private func delayText() {
            // Delay of 7.5 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 7.5) {
                hasTimeElapsed = true
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(motion: MotionManager())
    }
}

class MotionManager: ObservableObject {

    @Published var pitch: Double = 0.0
    @Published var roll: Double = 0.0
    @Published var yaw: Double = 0.0
    @Published var rotrate_x: Double = 0.0
    @Published var rotrate_y: Double = 0.0
    @Published var rotrate_z: Double = 0.0



    private var motionManager: CMMotionManager

    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.deviceMotionUpdateInterval = 1
        self.motionManager.startDeviceMotionUpdates(to: .main) { (motionData, error) in
            guard error == nil else {
                print(error!)
                return
            }

            if let motionData = motionData {
                self.pitch = motionData.attitude.pitch
                self.roll = motionData.attitude.roll
                self.yaw = motionData.attitude.yaw
                self.rotrate_x = motionData.rotationRate.x
                self.rotrate_y = motionData.rotationRate.y
                self.rotrate_z = motionData.rotationRate.z


            }
        }

    }
}
