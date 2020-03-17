//
//  PDFViewController.swift
//  Project3
//
//  Created by admin on 02/03/20.
//  Copyright © 2020 Dassault Systemes. All rights reserved.
//

import UIKit
import PDFKit


class PDFViewController: UIViewController, UIDocumentPickerDelegate, PDFViewDelegate, PDFDocumentDelegate {

    var pdfURL : URL?
    var pdfView : PDFView!
    var searchedItems: [PDFSelection] = []
    var document: PDFDocument!
    var searchedItem: PDFSelection?
    var highlight : PDFAnnotation!
    var lastpage : PDFPage!
    var searchText : UITextField?
    var searchButton : UIButton?
    var shareButton : UIButton?
    var backButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        edgesForExtendedLayout = UIRectEdge()//shift origin
        
        let docTypes = ["com.adobe.pdf"]

        let docPicker = UIDocumentPickerViewController(documentTypes: docTypes, in: UIDocumentPickerMode.open)
        docPicker.delegate = self
        docPicker.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(docPicker, animated: false, completion: nil)
    }


    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL){
        pdfURL = url
        print("url - \(url.path)")
        document = PDFDocument(url: url)
       // Add PDFView to view controller.
        pdfView = PDFView(frame: self.view.bounds)
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pdfView.delegate = self
        document?.delegate = self
        self.view.addSubview(pdfView)

        pdfView.autoScales = true
        //let fileURL = Bundle.main.url(forResource: "Sample", withExtension: "pdf")
        pdfView.document = PDFDocument(url: url)
        
        searchText = UITextField(frame: CGRect(x: 255, y: 10, width: 75, height: 30))
        searchText?.borderStyle = .roundedRect
        searchText?.placeholder = "search"
        
        searchButton = UIButton(frame: CGRect(x: 330, y: 10, width: 30, height: 30))
        let boldSearch = UIImage(named: "search.png")
        searchButton?.setImage(boldSearch, for: UIControl.State.normal)
        searchButton?.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        
        shareButton = UIButton(frame: CGRect(x: 60, y: 10, width: 30, height: 30))
        let shareicon = UIImage(named: "share.png")
        shareButton?.setImage(shareicon, for: UIControl.State.normal)
              
        shareButton?.addTarget(self, action: #selector(sharebuttonAction), for: .touchDown)
        
        backButton = UIButton(frame: CGRect(x: 10, y: 10, width: 50, height: 30))
        backButton?.setTitle("back", for: .normal)
        backButton?.addTarget(self, action: #selector(backbuttonAction), for: .touchDown)
        
        self.navigationController?.navigationBar.addSubview(searchText!)
        self.navigationController?.navigationBar.addSubview(searchButton!)
        self.navigationController?.navigationBar.addSubview(shareButton!)
        self.navigationController?.navigationBar.addSubview(backButton!)
    }


    @objc func buttonAction(sender: UIButton!) {
      let findstr = searchText?.text
        for i in 0..<document.pageCount {
            if let page = document.page(at: i) {
                let annotations = page.annotations
                for annotation in annotations {
                    page.removeAnnotation(annotation)
                }
            }
        }


        if searchedItems.count > 0 {
            if let page = searchedItems.last?.pages.last{
                while page.annotations.count > 0 {
                    page.removeAnnotation(page.annotations.last!)
                }
            }
        }


        if searchedItems.count > 0 {
            searchedItems.forEach {  selection in selection.pages.forEach {
                page in page.removeAnnotation(highlight)// = PDFAnnotation(bounds: selection.bounds(for: page), forType: .highlight, withProperties: nil)
                    //page.removeAnnotation(highlight)
                    lastpage.removeAnnotation(highlight)
                }
            }
        }

        searchedItems = (pdfView?.document?.findString(findstr!, withOptions: [.caseInsensitive]))!
        var count = 0

        searchedItems.forEach {  selection in selection.pages.forEach {

        page in highlight = PDFAnnotation(bounds: selection.bounds(for: page), forType: .highlight, withProperties: nil)
        highlight.endLineStyle = .square
        highlight.color = UIColor.orange.withAlphaComponent(0.5)

        page.addAnnotation(highlight)
        count = count + 1
        if count == 1{
        lastpage = page
        pdfView.go(to: page)
        return
        }
        }
        }
    }
    
    @objc func sharebuttonAction(sender: UIButton!) {
      let items = [pdfURL]
      let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
      present(ac, animated: true)
    }

    @objc func backbuttonAction(sender: UIButton!) {
        print("back clicked")
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
     func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
         print("Nothing selected")
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
     }

}

