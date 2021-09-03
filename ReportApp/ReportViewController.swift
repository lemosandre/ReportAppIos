//
//  ReportViewController.swift
//  ReportApp
//
//  Created by Andre Lemos on 2021-09-01.
//

import UIKit

class ReportViewController: UIViewController {

    @IBOutlet weak var textFildName: UITextField!
    @IBOutlet weak var textFieldAddress: UITextField!
    @IBOutlet weak var textFieldDescripition: UITextField!
    @IBOutlet weak var buttonImage: UIButton!
    @IBOutlet weak var imageViewPost: UIImageView!
    @IBOutlet weak var buttonAddEdit: UIButton!
    
    var report: Report?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let report = report{
             title = "Edicao"
            textFildName.text = report.name
            textFieldAddress.text = report.address
            textFieldDescripition.text = report.descriptionData
            if let image = report.image{
                imageViewPost.image = UIImage(data: image)
            }
            buttonAddEdit.setTitle("Editar", for: .normal)
        }

    }
    

    @IBAction func selectImg(_ sender: Any) {
        
        let alert = UIAlertController(title: "Selecionar uma Imagem", message: "Escolha sua Imagem",preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraButton = UIAlertAction(title: "Camera", style: .default) { _ in
                self.selectPicture(sourceType: .camera)
            }
            alert.addAction(cameraButton)
        }
        
        let libraryAction = UIAlertAction(title: "Bibblioteca", style: .default) { _ in
            self.selectPicture(sourceType: .photoLibrary)
        }
        alert.addAction(libraryAction)
        
        let albumAction = UIAlertAction(title: "Album", style: .default) { _ in
            self.selectPicture(sourceType: .savedPhotosAlbum)
        }
        alert.addAction(albumAction)
        
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil )
        alert.addAction(cancelButton)
        present(alert , animated: true, completion: nil)
        
    }
    
    func selectPicture(sourceType: UIImagePickerController.SourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func saveedit(_ sender: Any) {
        if report == nil {
            report = Report(context: context)
        }
        
        report?.name = textFildName.text
        report?.address = textFieldAddress.text
        report?.descriptionData = textFieldDescripition.text
        report?.image = imageViewPost.image?.jpegData(compressionQuality: 0.9)
        
        try? context.save()
        
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ReportViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            imageViewPost.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
}
