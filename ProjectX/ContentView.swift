//
//  ContentView.swift
//  ProjectX
//
//  Created by Darin Doria on 2/15/20.
//  Copyright © 2020 Darin Doria. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let farmPicker = FarmPicker()
    
    @State var showOptions = false
    @State var inputLength = "24"
    @State var inputWidth = "38"
    @State var inputHeight = "84"
    
    var body: some View {
        VStack {
            Text("Easy Farm")
                .font(.title)
            
            Spacer()
            
            Text("Tell us about your available space")
                .font(.headline)
            
            HStack {
                Text("Length (in)")
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 100)

                TextField("Length", text: $inputLength)
                    .keyboardType(.numberPad)
            }
            .padding()
            
            HStack {
                Text("Width (in)")
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 100)
                
                TextField("Width", text: $inputWidth)
                    .keyboardType(.numberPad)
                
            }
            .padding()
            
            HStack {
                Text("Height (in)")
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 100)
                
                TextField("Height", text: $inputHeight)
                    .keyboardType(.numberPad)
            }
            .padding()
            
            Spacer()
            
//            Button(action: {
//                self.showOptions = true
//            }) {
//            }
            
            Button(action: {
                self.showOptions = true
            }) {
                Text("What can I build?")
            }.sheet(isPresented: $showOptions, onDismiss: {
                self.showOptions = false
            }) {
                FarmOptionsModal(isPresented: self.$showOptions, farms: self.farmPicker.getFarms(dimensions: Dimensions(
                               width: Double(self.inputWidth)!,
                               length: Double(self.inputLength)!,
                               height: Double(self.inputHeight)!
                           )))
            }
        }
    }
}

struct FarmOptionsModal : View {
    @Binding var isPresented: Bool
    let farms: [Farm]
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(farms, id: \.name) { farm in
                    CardView(
                        title: farm.name,
                        subtitle: "$\(farm.buildCost())/week",
                        content: "You can farm \(farm.cropSites()) crops per week with this system."
                    )
                        .frame(width: 340.0, height: 320)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(radius: 20)
                        .padding(.bottom)
                }
            }.padding(.top)
        }
    }
}

struct CardView: View {
    var title: String
    var subtitle: String
    var content: String
    
    func computeImage() -> String {
//        let rDiff = rGuess - rTarget
//        let gDiff = gGuess - gTarget
//        let bDiff = bGuess - bGuess
//        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
//
        let image = title == "NFT System" ? "nft-system" : "kratky-system";
        
        return image
    }
    
    var body: some View {
        VStack {
            VStack {
//                var image = self.title == "NFT" ?  : "kratky-system"
                Image(computeImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 120)
                
                HStack {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.leading)
                        .padding(.top, 30)
                        .foregroundColor(Color.black)
                
                    Spacer()
                    
                    Text(subtitle)
                        .font(.subheadline)
                        .padding(.top, 25)
                        .padding(.trailing)
                        .foregroundColor(Color.gray)
                }
                
                Text(content)
                    .font(.body)
//                    .fontWeight(.semibold)
//                    .padding(.leading)
                    .padding(.horizontal, 12)
                    .padding(.top, 20)
                    .foregroundColor(Color.black)
            }
                
            
            
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
