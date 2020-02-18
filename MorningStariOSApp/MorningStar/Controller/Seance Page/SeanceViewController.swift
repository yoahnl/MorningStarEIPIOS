//
//  SeanceViewController.swift
//  MorningStar
//
//  Created by Guillaume Djaider Fornari on 11/12/2019.
//  Copyright © 2019 Yoahn Linard. All rights reserved.
//

import UIKit
import CoreNFC
import Parse
import ParseLiveQuery

class SeanceViewController: UIViewController {
    
    @IBOutlet weak var pickMachine: UIPickerView!
    @IBOutlet weak var MachinesCollectionView: UICollectionView!
    @IBOutlet weak var nameMachine: UILabel!
    @IBOutlet weak var repetionLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var CurrentRepetitionTableView: UITableView!
    @IBOutlet weak var buttonNewRepetition: UIButton!
    @IBOutlet weak var buttonNewMachine: UIButton!
    @IBOutlet weak var buttonConfirmeMachine: UIButton!
    
    var pickerData: [String] = []
    var nfcSession: NFCNDEFReaderSession?
    var machineInfo = MachineInfo()
    var liveQueryClient: ParseLiveQuery.Client!
    var subscription: Subscription<MachineInfo>!
    var machineQuery = MachineInfo.query() as! PFQuery<MachineInfo>

    override func viewDidLoad() {
        super.viewDidLoad()
        self.weightLabel.text = ""
        machineQuery.findObjectsInBackground { (objects, error) in
            if let errorMessage = error?.localizedDescription {
                print("Error message:", errorMessage)
            } else {
                for object in objects ?? [] {
                    self.pickerData.append((object["Name"] as? String ?? "ErrorNameMachine"))
                }
                self.pickMachine.reloadAllComponents()
            }
        }
    }
    
    @IBAction func newRepetition(_ sender: Any) {
        self.machineInfo.addCurrentRepetition()
        DispatchQueue.main.async {
            self.CurrentRepetitionTableView.reloadData()
            self.repetionLabel.text = ""
            self.weightLabel.text = ""
        }
    }
    
    @IBAction func newMachine(_ sender: Any) {
        self.machineInfo.currentMachineFinished()
        DispatchQueue.main.async {
            self.MachinesCollectionView.reloadData()
            self.CurrentRepetitionTableView.reloadData()
            self.repetionLabel.text = ""
            self.weightLabel.text = ""
        }
    }
    
    func subscribe() {
        subscription = liveQueryClient
        .subscribe(machineQuery)

        .handle(Event.updated)
        { _, machineInfo in
            self.machineInfo.addCurrentInformation(data: machineInfo)
            DispatchQueue.main.async {
                self.repetionLabel.text = self.machineInfo.currentRepetition.0
                self.weightLabel.text = self.machineInfo.currentRepetition.1 + "Kg"
            }
        }
    }
    
    @IBAction func buttonScanNFC(_ sender: Any) {
        /*nfcSession = NFCNDEFReaderSession.init(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        nfcSession?.begin()*/
        self.pickMachine.isHidden = false
        self.buttonConfirmeMachine.isHidden = false
        self.buttonNewMachine.isHidden = true
        self.buttonNewRepetition.isHidden = true
    }
    
    @IBAction func buttonConfirmeMachine(_ sender: Any) {
        liveQueryClient = ParseLiveQuery.Client()
        self.machineQuery = MachineInfo.query()?.whereKey("Name", equalTo: self.machineInfo.currentNameMachine) as! PFQuery<MachineInfo>
        subscribe()
        self.pickMachine.isHidden = true
        self.buttonConfirmeMachine.isHidden = true
        self.buttonNewMachine.isHidden = false
        self.buttonNewRepetition.isHidden = false
    }
}



extension SeanceViewController: NFCNDEFReaderSessionDelegate {
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        NSLog("The session was invalidated: \(error.localizedDescription)")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        for payload in messages[0].records {
            NSLog(String.init(data: payload.payload.advanced(by: 3), encoding: .utf8) ?? "Formate not supported")
        }
    }
}

extension SeanceViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.machineInfo.allMachines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MachineCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MachineCell", for: indexPath) as! MachineCollectionViewCell
        cell.setMachine(data: self.machineInfo.allMachines[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 152, height: 252)
    }
}

extension SeanceViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.machineInfo.currentMachine.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CurrentDataMachineTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CurrentMachine") as! CurrentDataMachineTableViewCell
        cell.setContent(dataRepetion: self.machineInfo.currentMachine[indexPath.row].0, dataPoids: self.machineInfo.currentMachine[indexPath.row].1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 81
    }
}

extension SeanceViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.machineInfo.setCurrentNameMachine(picked: pickerData[row])
    }
}


class MachineInfo: PFObject, PFSubclassing {
  
    var currentMachine: [(String, String)] = []
    var allMachines: [(String, [(String, String)])] = []
    var currentRepetition: (String, String) = ("", "")
    var index = 1
    var currentNameMachine: String = ""
    
    static func parseClassName() -> String {
        return "Machine"
    }
    
    func addCurrentInformation(data: MachineInfo) {
        let pushedNumber: String = String(format: "%@", data.object(forKey: "PushedNumber") as! CVarArg)
        let currentWeight: String = String(format: "%@", data.object(forKey: "currentWeight") as! CVarArg)
        
        self.currentRepetition = (pushedNumber, currentWeight)
        //self.currentMachine.append(self.currentRepetition)
    }
    
    func currentMachineFinished() {
        self.allMachines.append(("Machine " + String(self.index), self.currentMachine))
        self.currentMachine.removeAll()
        self.index += 1
    }
    
    func addCurrentRepetition() {
        self.currentMachine.append(self.currentRepetition)
    }
    
    func setCurrentNameMachine(picked: String) {
        self.currentNameMachine = picked
    }
}
