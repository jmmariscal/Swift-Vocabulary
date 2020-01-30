//
//  DefinitionViewController.swift
//  Swift Vocabulary
//
//  Created by Juan M Mariscal on 1/28/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {

    @IBOutlet weak var labelTextField: UILabel!
    @IBOutlet weak var definitionTextField: UITextView!
    
    var vocabWord: VocabularyWord?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        if let vocabWord = vocabWord {
            labelTextField.text = vocabWord.word
            definitionTextField.text = vocabWord.definition
        }
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
