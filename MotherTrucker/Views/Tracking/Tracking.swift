//
//  Tracking.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/28/22.
//

import SwiftUI
import CoreLocation
import MapKit

struct TrackingView: View {
    var width, height: CGFloat
    @StateObject private var viewModel  = TrackingViewModel()
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, interactionModes: [.all], showsUserLocation: true, userTrackingMode: .constant(.follow))
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    viewModel.checkIfLocationServicesEnabled()
                }
            VStack {
                Spacer()
                StartEndView(width: width, height: height, startAdr: "8504 W Sethane Rd", endAdr: "3001 E Revington Ln")
                LocateMyTruck(width: width, height: height)
                    .padding()
            }
        }
        .navigationBarColor(backgroundColor: Color(hex: 0xFFFFFF, opacity: 0.6))
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Tracking")
                    .fontWeight(.bold)
                    .font(.system(size: 35))
            }
        }
    }
}

struct StartEndView: View {
    var width, height: CGFloat
    var startAdr, endAdr: String
    var style = StrokeStyle(lineWidth: 2, dash: [3])
    
    var body: some View {
        ZStack {
            Color.white
            HStack {
                VStack(spacing: 7) {
                    LocationCircle()
                    
                    DottedLine()
                    
                    Image(systemName: "mappin")
                }.padding(.leading)
                
                VStack(spacing: 20) {
                    HStack {
                        Text(startAdr)
                            .fontWeight(.medium)
                            .font(.system(size: 14))
                            .padding(.leading)
                        Spacer()
                    }
                    Divider()
                        .padding(.trailing)
                    HStack {
                        Text(endAdr)
                            .fontWeight(.medium)
                            .font(.system(size: 14))
                            .padding(.leading)
                        Spacer()
                    }
                }
            }
            
        }
        .frame(width: round(width * 0.8816), height: round(height * 0.1462))
        .cornerRadius(20)
    }
}

struct LocationCircle: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(hex: 0xE0ECFF))
                .frame(width: 28, height: 28)
            Circle()
                .foregroundColor(Color(hex: 0x3B82F6))
                .frame(width: 16, height: 16)
        }
    }
}

struct DottedLine: View {
    var body: some View {
        VStack(spacing: 2) {
            Circle()
                .frame(width: 2, height: 2)
                .foregroundColor(Color(hex: 0x6B7280))
            Circle()
                .frame(width: 2, height: 2)
                .foregroundColor(Color(hex: 0x6B7280))
            Circle()
                .frame(width: 2, height: 2)
                .foregroundColor(Color(hex: 0x6B7280))
            Circle()
                .frame(width: 2, height: 2)
                .foregroundColor(Color(hex: 0x6B7280))
            Circle()
                .frame(width: 2, height: 2)
                .foregroundColor(Color(hex: 0x6B7280))
            Circle()
                .frame(width: 2, height: 2)
                .foregroundColor(Color(hex: 0x6B7280))
            Circle()
                .frame(width: 2, height: 2)
                .foregroundColor(Color(hex: 0x6B7280))
        }
    }
}

struct LocateMyTruck: View {
    var width, height: CGFloat
    
    var body: some View {
        HStack {
            Spacer()
            Text("Locate my truck")
                .fontWeight(.bold)
                .font(.system(size: 15))
            Spacer()
            Image(systemName: "arrow.right")
                .padding(.trailing)
        }
        .frame(width: round(width * 0.8768), height: round(height * 0.0676))
        .background(
            LinearGradient(colors: [Color(hex: 0x2ED573),
                                    Color(hex: 0x7BED9F)],
                           startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(13)
    }
}

/* View Model */

final class TrackingViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    @Published var region = MKCoordinateRegion(center:
                                                CLLocationCoordinate2D(latitude: 47.608013,
                                                                       longitude: -122.335167),
                                               span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    func checkIfLocationServicesEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.startUpdatingLocation()
        }else {
            print("Location permissions are not available")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location permissions are restricted")
        case .denied:
            print("Location permissions are denied")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location?.coordinate
                                        ?? CLLocationCoordinate2D(latitude: 47.608013, longitude: -122.335167),
                                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

/* TOP BAR MODIFIER */

struct NavigationBarModifier: ViewModifier {

    var backgroundColor: UIColor?
    
    init(backgroundColor: Color) {
        self.backgroundColor = UIColor(backgroundColor)
    }

    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top - 40)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

struct TrackingView_Preview: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            TrackingView(width: geo.size.width, height: geo.size.height)
        }
    }
}

extension View {
    func navigationBarColor(backgroundColor: Color) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
}
