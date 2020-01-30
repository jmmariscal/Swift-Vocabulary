//
//  WordsTableViewController.swift
//  Swift Vocabulary
//
//  Created by Juan M Mariscal on 1/28/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {

    var vocabWords: [VocabularyWord] = [
        VocabularyWord(word: "Variable", definition: "A named value used to store information. It can be changed, added to, or deleted throught the program."),
        VocabularyWord(word: "Constant", definition: "A property that once set can not be changed, delted, or added-to after being set."),
        VocabularyWord(word: "Function", definition: "A function is a set a rules for the program to follow.")
    
    ]

    @IBAction func newWordBtn(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Add Word", message: nil, preferredStyle: .alert)
        alertController.addTextField { (addWordTextField) in
            addWordTextField.placeholder = "Add Word"
        }
        alertController.addTextField { (addDefinitionTextField) in
            addDefinitionTextField.placeholder = "Add Definition"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            
            guard let word = alertController.textFields![0].text,
                let definition = alertController.textFields![1].text,
                !word.isEmpty,
                !definition.isEmpty else { return }
            
            let vocabWord = VocabularyWord(word: word, definition: definition)
            self.vocabWords.append(vocabWord)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        [saveAction, cancelAction].forEach { alertController.addAction($0) }
        present(alertController, animated: true)
        
        self.tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocabWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
        let word = vocabWords[indexPath.row]
        cell.textLabel?.text = word.word

        return cell
    }

    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDefinitionSegue" {
            if let definitionVC = segue.destination as? DefinitionViewController,
               let indexPath = tableView.indexPathForSelectedRow {
                
                let word = vocabWords[indexPath.row]
                definitionVC.vocabWord = word
            }
        }
    }
    

}
