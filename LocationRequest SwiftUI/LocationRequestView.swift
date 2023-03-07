//
//  LocationRequestView.swift
//  LocationRequest SwiftUI
//
//  Created by Sobirov on 06/03/23.
//

import SwiftUI

struct LocationRequestView: View{
    var body: some View{
        ZStack{
            Color(.systemBlue).ignoresSafeArea()
            
            VStack{
                Spacer()
                
                Image(systemName: "paperplane.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200,height: 200)
                    .padding(.bottom,32)
                
                Text(String("\(LocationManager.shared.userLocation)"))
                    .font(.system(size: 28,weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding(.top,16)
                
                
                Text("Start sharing location with us")
                    .multilineTextAlignment(.center)
                    .padding(.top,32)
                
                Spacer()
                
                VStack{
                    Button{
                        LocationManager.shared.requestLocation()
                    }label: {
                        Text("Allow Location")
                            .padding()
                            .font(.headline)
                            .foregroundColor(Color(.systemBlue))
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.horizontal,-32)
                    .background(.white)
                    .clipShape(Capsule())
                    .padding()
                }
            }.foregroundColor(.white)
        }
    }
}

