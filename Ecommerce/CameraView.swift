//
//  CameraView.swift
//  Ecommerce
//
//  Created by Avinash on 14/11/2024.
//

import SwiftUI
import UIKit

struct CameraView: UIViewControllerRepresentable {
    

    @Binding var image : Image?
    @Environment(\.presentationMode) var ispresented
    
    
    func makeCoordinator() -> CameraCoordinator {
        return CameraCoordinator(camera: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {

        let coordinator = UIImagePickerController()
        
        coordinator.sourceType = .camera
        coordinator.delegate = context.coordinator
        return coordinator
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}


class CameraCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    var camera : CameraView
    
    init(camera: CameraView) {
        self.camera = camera
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        camera.image = Image(uiImage: image)
        camera.ispresented.wrappedValue.dismiss()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        camera.ispresented.wrappedValue.dismiss()
    }
    
}
