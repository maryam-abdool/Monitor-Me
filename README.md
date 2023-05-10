# Monitor-Me (My Submission for the Apple WWDC22 Swift Student Challenge)
Project Description:

The goal of my app Monitor Me is to inform users when their devices have been accessed without their permission from offline users (family, friends, and colleagues). Most apps detect online malicious behavior. However, what if someone you personally know has figured out your password and has been accessing your phone?

Monitor Me solves this problem all while respecting the user’s and apple’s privacy policy. The idea behind Monitor Me is to use motion sensor data to keep a log of user access to the device. For example, if the user suspects that someone has been accessing their phone between 2:00-3:00 pm, they can turn on the app to detect motion (using the Accelerometer from CMMotionManager()). The app instructs the users to put the phone faced down within 5 seconds of pressing play and leaving during the 2:00-3:00 pm interval. They can then come back and flip the phone again. The time displayed within the app reveals if someone has flipped the phone during that time interval. The app is able to distinguish the owner’s from the intruder’s flips by ignoring the first and last flip if applicable. With this setup, a flip is defined by the change from all negative values of the accelerometer’s (x,y,z) values.  

Project Information:

The swift files are located in the Shared folder of the main Monitor Me Submit folder. Main code is in the ContentView file. For best visualization, use the iPhone 11 Pro Max simulator. I have also tested the app on a physical iPhone X (to get real motion data). Run in Xcode. All assets (in the assets folder) are designed by me using Sketch.

Simulator Photos:
![Simulator Screen Shot - iPhone 11 Pro Max - 2022-09-27 at 01 34 00](https://user-images.githubusercontent.com/78284219/192458701-4f2441c4-2daa-4600-85f0-2f5bf8dc1d86.png) ![Simulator Screen Shot - iPhone 11 Pro Max - 2022-09-27 at 01 34 41](https://user-images.githubusercontent.com/78284219/192458720-f2b8e006-d947-4040-abf3-43a0b95b14d3.png)

