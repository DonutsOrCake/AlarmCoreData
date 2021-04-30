//
//  AlarmTableViewCell.swift
//  AlarmCoreData
//
//  Created by Bryson Jones on 4/29/21.
//

import UIKit

protocol AlarmTableViewCellDelegate: AnyObject {
    
    func alarmWasToggled(sender: AlarmTableViewCell)
}

class AlarmTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var alarmTitleLabel: UILabel!
    @IBOutlet weak var alarmFireDateLabel: UILabel!
    @IBOutlet weak var isEnabledSwitch: UISwitch!
    
    weak var delegate: AlarmTableViewCellDelegate?
    
    //MARK: - Helper Functions
    func updateViews(with alarm: Alarm) {
        alarmTitleLabel.text = alarm.title
        alarmFireDateLabel.text = alarm.fireDate!.stringValue()
        isEnabledSwitch.isOn = alarm.isEnabled
    }
    
    //MARK: - Actions
    @IBAction func isEnabledSwitchToggled(_ sender: Any) {
        delegate?.alarmWasToggled(sender: self)
    }
}

