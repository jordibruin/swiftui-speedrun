//
//  ContentView.swift
//  CameraSpeedrun
//
//  Created by Jordi Bruin on 21/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            backgroundPhoto
            ui
        }
    }
    
    var backgroundPhoto: some View {
        Image("photo")
            .resizable()
            .edgesIgnoringSafeArea(.all)
    }
    
    var ui: some View {
        VStack(spacing: 0) {
            top
            photoSpace
            bottom
        }
    }
    
    var top: some View {
        HStack {
            Image(systemName: "bolt.circle")
            Spacer()
            Image(systemName: "chevron.up.circle.fill")
            Spacer()
            Image(systemName: "livephoto")
        }
        .padding()
        .padding(.bottom, 12)
        .background(Color.black.opacity(0.5))
        .font(.title2)
        .foregroundColor(.white)
    }
    
    var photoSpace: some View {
        ZStack {
            Color.clear
            outsideLines
            zoomButtons
        }
        
    }
    
    @State var selectedZoom = "1"
    
    var zoomButtons: some View {
        VStack {
            Spacer()
            HStack {
                ZoomCircle(text: "0,5", selected: selectedZoom == "0,5")
                    .onTapGesture {
                        selectedZoom = "0,5"
                    }
                ZoomCircle(text: "1", selected: selectedZoom == "1")
                    .onTapGesture {
                        selectedZoom = "1"
                    }
                ZoomCircle(text: "3", selected: selectedZoom == "3")
                    .onTapGesture {
                        selectedZoom = "3"
                    }
            }
            .padding(.bottom)
        }
    }
    
    var outsideLines: some View {
        ZStack {
            VStack {
                HStack {
                    HorizontalLine()
                    Spacer()
                    HorizontalLine()
                }
                Spacer()
                
                HStack {
                    HorizontalLine()
                    Spacer()
                    HorizontalLine()
                }
            }
            
            HStack {
                VStack {
                    VerticalLine()
                    Spacer()
                    VerticalLine()
                }
                Spacer()
                
                VStack {
                    VerticalLine()
                    Spacer()
                    VerticalLine()
                }
            }
        }
    }
    
    var bottom: some View {
        VStack {
            slider
            bottomButtons
        }
        .background(Color.black.opacity(0.8))
    }
    
    var slider: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                Text("CINEMATIC")
                    .bold()
                Text("VIDEO")
                    .bold()
                Text("PHOTO")
                    .bold()
                    .foregroundColor(.yellow)
                Text("PORTRAIT")
                    .bold()
                Text("PANO")
                    .bold()
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .font(.body)
            .foregroundColor(.white)
        }
        .overlay(
            LinearGradient(stops: [
                .init(color: .black, location: 0),
                .init(color: .black.opacity(0), location: 0.1),
                .init(color: .black.opacity(0), location: 0.9),
                .init(color: .black, location: 1),
            ], startPoint: .leading, endPoint: .trailing)
        )
    }
    var bottomButtons: some View {
        HStack {
            Image("photo")
                .resizable()
                .frame(width: 64, height: 64)
                .cornerRadius(8)
            Spacer()
            Button {
                print("Take photo")
            } label: {
                Circle()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                    .overlay(
                        Circle()
                            .strokeBorder()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.black)
                    )
            }

            Spacer()
            Image(systemName: "arrow.triangle.2.circlepath")
                .foregroundColor(.white)
                .font(.title2)
                .frame(width: 58, height: 58)
                .background(
                    Circle()
                        .foregroundColor(.secondary)
                )
                .foregroundColor(.white)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HorizontalLine: View {
    var body: some View {
        Rectangle()
            .frame(width: 26, height: 1)
            .foregroundColor(.white)
            .opacity(0.7)
    }
}


struct VerticalLine: View {
    var body: some View {
        Rectangle()
            .frame(width: 1, height: 26)
            .foregroundColor(.white)
            .opacity(0.7)
    }
}

struct ZoomCircle: View {
    var text: String
    let selected: Bool
    
    var body: some View {
        Text(text)
            .frame(width: selected ? 48 : 40, height: selected ? 48 : 40)
            .background(
                Circle()
                    .foregroundColor(.black.opacity(0.7))
            )
            .foregroundColor(.white)
    }
}

