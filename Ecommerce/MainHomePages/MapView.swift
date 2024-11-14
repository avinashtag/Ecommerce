//
//  MapView.swift
//  Ecommerce
//
//  Created by Avinash on 11/11/2024.
//

import SwiftUI
import MapKit


extension MKCoordinateRegion {
    
    static let boston = MKCoordinateRegion ( center: CLLocationCoordinate2D( latitude: 42.360256,
                                                                             longitude: -71.057279), span: MKCoordinateSpan ( latitudeDelta: 0.1,
                                                                                                                              longitudeDelta: 0.1))
    
    static let northShore = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 42.547408,
            longitude: -70.870085),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5))
    
    static let delhi = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 28.6139,
            longitude: 77.2088),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5))

    
}

extension CLLocationCoordinate2D{
    static let parking = CLLocationCoordinate2D(latitude: 42.354528, longitude: -71.068369)
}


struct MapView: View {
    
    @State var cameraPosition: MapCameraPosition = .automatic
    @State var searchResult: [MKMapItem] = []
    @State var visibleRegion: MKCoordinateRegion?
    @State var selected: MKMapItem?
    @State var route: MKRoute?

    
    var body: some View {
        
        MapReader { proxy in
            Map(position: $cameraPosition, selection:$selected ){
                Annotation("Parking", coordinate: .parking) {
                    VStack{
                        Image(systemName: "car")
                    }
                }
                .annotationTitles(.hidden)
                
                ForEach(searchResult, id: \.self){ item in
                    Marker(item: item)
                }
                
                if let route{
                    MapPolyline(route)
                        .stroke(.blue, lineWidth: 5)
                }
            }
        }
        .mapControls({
            MapUserLocationButton()
            MapScaleView()
            MapCompass()
        })
        .mapStyle(.standard(elevation: .realistic))
        .safeAreaInset(edge: .bottom) {
            HStack{
                Spacer()
                VStack{
                    if let selected {
                        MapItemDetails(route: $route, selected: $selected)
                            .padding(.vertical, 10)
                            .frame(height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                 
                    BeantownButton(searchResults: $searchResult, position: $cameraPosition, visibleRegion: $visibleRegion)
                        .padding(.top, 10)

                }
                Spacer()
            }
            .background(.thinMaterial)
        }
        .onChange(of: selected) {
            getDirections()
        }
        .task {
            NotificationCenter.default.addObserver(forName: NSNotification.Name("SuccessLoadAllProducts"), object: nil, queue: nil) { notification in
                print("Map Success Notification")
            }
        }

        
    }
    
    func getDirections(){
        route = nil
        guard let selected else { return }
        
        let request = MKDirections.Request()
        // userloactionSource = MKMapItem(placemark: MKPlacemark(coordinate: MKUserLocation().coordinate))
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: .parking))
        request.destination = selected
        
        Task{
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            route = response?.routes.first
        }
    }

}

#Preview {
    MapView()
}

/*
 Mapkit ios
 1. Google map
 2. ESRI map
 
 */
