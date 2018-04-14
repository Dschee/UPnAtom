//
//  RootFolderViewController.swift
//
//  Copyright (c) 2015 David Robles
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit
import UPnAtom

class RootFolderViewController: UIViewController {
<<<<<<< HEAD
    private var _discoveredDeviceUSNs = [UniqueServiceName]()
    private var _discoveredUPnPObjectCache = [UniqueServiceName: AbstractUPnP]()
    private var _archivedDeviceUSNs = [UniqueServiceName]()
    private var _archivedUPnPObjectCache = [UniqueServiceName: AbstractUPnP]()
    private static let upnpObjectArchiveKeyOld = "upnpObjectArchiveKeyOld"
    private weak var _toolbarLabel: UILabel?
    @IBOutlet private weak var _tableView: UITableView!
    private let _archivingUnarchivingQueue: NSOperationQueue = {
        let queue = NSOperationQueue()
=======
    fileprivate var _discoveredDeviceUSNs = [UniqueServiceName]()
    fileprivate var _discoveredUPnPObjectCache = [UniqueServiceName: AbstractUPnP]()
    fileprivate var _archivedDeviceUSNs = [UniqueServiceName]()
    fileprivate var _archivedUPnPObjectCache = [UniqueServiceName: AbstractUPnP]()
    fileprivate static let upnpObjectArchiveKeyOld = "upnpObjectArchiveKeyOld"
    fileprivate weak var _toolbarLabel: UILabel?
    @IBOutlet fileprivate weak var _tableView: UITableView!
    fileprivate let _archivingUnarchivingQueue: OperationQueue = {
        let queue = OperationQueue()
>>>>>>> swift3
        queue.name = "Archiving and unarchiving queue"
        return queue
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize
        UPnAtom.sharedInstance.ssdpTypes = [
            SSDPTypeConstant.Roku.rawValue
            
            /*
            SSDPTypeConstant.All.rawValue,
            SSDPTypeConstant.MediaServerDevice1.rawValue,
            SSDPTypeConstant.MediaRendererDevice1.rawValue,
            SSDPTypeConstant.ContentDirectory1Service.rawValue,
            SSDPTypeConstant.ConnectionManager1Service.rawValue,
            SSDPTypeConstant.RenderingControl1Service.rawValue,
            SSDPTypeConstant.AVTransport1Service.rawValue
            */
        ]
        
        loadArchivedUPnPObjects()
        
        self.title = "Control Point Demo"
        
        let viewWidth = self.navigationController!.view.frame.size.width
        let titleLabel = UILabel(frame: CGRect(x: 0.0, y: 11.0, width: viewWidth - (viewWidth * 0.2), height: 21.0))
        _toolbarLabel = titleLabel
        titleLabel.font = UIFont(name: "Helvetica", size: 18)
<<<<<<< HEAD
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.textAlignment = .Left
=======
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .left
>>>>>>> swift3
        titleLabel.text = ""
        let barButton = UIBarButtonItem(customView: titleLabel)
        self.toolbarItems = [Player.sharedInstance.playPauseButton, Player.sharedInstance.stopButton, barButton]
        
<<<<<<< HEAD
        self.navigationController?.toolbarHidden = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RootFolderViewController.deviceWasAdded(_:)), name: UPnPRegistry.UPnPDeviceAddedNotification(), object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RootFolderViewController.deviceWasRemoved(_:)), name: UPnPRegistry.UPnPDeviceRemovedNotification(), object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RootFolderViewController.serviceWasAdded(_:)), name: UPnPRegistry.UPnPServiceAddedNotification(), object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RootFolderViewController.serviceWasRemoved(_:)), name: UPnPRegistry.UPnPServiceRemovedNotification(), object: nil)
    }
    
    override func viewDidDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UPnPRegistry.UPnPDeviceAddedNotification(), object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UPnPRegistry.UPnPDeviceRemovedNotification(), object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UPnPRegistry.UPnPServiceAddedNotification(), object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UPnPRegistry.UPnPServiceRemovedNotification(), object: nil)
=======
        self.navigationController?.isToolbarHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(RootFolderViewController.deviceWasAdded(_:)), name: NSNotification.Name(rawValue: UPnPRegistry.UPnPDeviceAddedNotification()), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RootFolderViewController.deviceWasRemoved(_:)), name: NSNotification.Name(rawValue: UPnPRegistry.UPnPDeviceRemovedNotification()), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RootFolderViewController.serviceWasAdded(_:)), name: NSNotification.Name(rawValue: UPnPRegistry.UPnPServiceAddedNotification()), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RootFolderViewController.serviceWasRemoved(_:)), name: NSNotification.Name(rawValue: UPnPRegistry.UPnPServiceRemovedNotification()), object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: UPnPRegistry.UPnPDeviceAddedNotification()), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: UPnPRegistry.UPnPDeviceRemovedNotification()), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: UPnPRegistry.UPnPServiceAddedNotification()), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: UPnPRegistry.UPnPServiceRemovedNotification()), object: nil)
>>>>>>> swift3
        
        super.viewDidDisappear(animated)
    }
    
<<<<<<< HEAD
    @IBAction private func discoverButtonTapped(sender: AnyObject) {
        performSSDPDiscovery()
    }
    
    @IBAction private func archiveButtonTapped(sender: AnyObject) {
        archiveUPnPObjects()
    }

    @objc private func deviceWasAdded(notification: NSNotification) {
=======
    @IBAction fileprivate func discoverButtonTapped(_ sender: AnyObject) {
        performSSDPDiscovery()
    }
    
    @IBAction fileprivate func archiveButtonTapped(_ sender: AnyObject) {
        archiveUPnPObjects()
    }

    @objc fileprivate func deviceWasAdded(_ notification: Notification) {
>>>>>>> swift3
        if let upnpDevice = notification.userInfo?[UPnPRegistry.UPnPDeviceKey()] as? AbstractUPnPDevice {
            print("Added device: \(upnpDevice.className) - \(upnpDevice.friendlyName)")
            
            _discoveredUPnPObjectCache[upnpDevice.usn] = upnpDevice
            insertDevice(deviceUSN: upnpDevice.usn, deviceUSNs: &_discoveredDeviceUSNs, inSection: 1)
        }
    }
    
<<<<<<< HEAD
    @objc private func deviceWasRemoved(notification: NSNotification) {
        if let upnpDevice = notification.userInfo?[UPnPRegistry.UPnPDeviceKey()] as? AbstractUPnPDevice {
            print("Removed device: \(upnpDevice.className) - \(upnpDevice.friendlyName)")
            
            _discoveredUPnPObjectCache.removeValueForKey(upnpDevice.usn)
=======
    @objc fileprivate func deviceWasRemoved(_ notification: Notification) {
        if let upnpDevice = notification.userInfo?[UPnPRegistry.UPnPDeviceKey()] as? AbstractUPnPDevice {
            print("Removed device: \(upnpDevice.className) - \(upnpDevice.friendlyName)")
            
            _discoveredUPnPObjectCache.removeValue(forKey: upnpDevice.usn)
>>>>>>> swift3
            deleteDevice(deviceUSN: upnpDevice.usn, deviceUSNs: &_discoveredDeviceUSNs, inSection: 1)
        }
    }
    
<<<<<<< HEAD
    @objc private func serviceWasAdded(notification: NSNotification) {
        if let upnpService = notification.userInfo?[UPnPRegistry.UPnPServiceKey()] as? AbstractUPnPService {
            let friendlyName = (upnpService.device != nil) ? upnpService.device!.friendlyName : "Service's device object not created yet"
            print("Added service: \(upnpService.className) - \(friendlyName)")
=======
    @objc fileprivate func serviceWasAdded(_ notification: Notification) {
        if let upnpService = notification.userInfo?[UPnPRegistry.UPnPServiceKey()] as? AbstractUPnPService {
            let friendlyName = (upnpService.device != nil) ? upnpService.device!.friendlyName : "Service's device object not created yet"
            print("Added service: \(upnpService.className) - \(friendlyName ?? "")")
>>>>>>> swift3
            
            _discoveredUPnPObjectCache[upnpService.usn] = upnpService
        }
    }
    
<<<<<<< HEAD
    @objc private func serviceWasRemoved(notification: NSNotification) {
        if let upnpService = notification.userInfo?[UPnPRegistry.UPnPServiceKey()] as? AbstractUPnPService {
            let friendlyName = (upnpService.device != nil) ? upnpService.device!.friendlyName : "Service's device object not created yet"
            print("Removed service: \(upnpService.className) - \(friendlyName)")
=======
    @objc fileprivate func serviceWasRemoved(_ notification: Notification) {
        if let upnpService = notification.userInfo?[UPnPRegistry.UPnPServiceKey()] as? AbstractUPnPService {
            let friendlyName = (upnpService.device != nil) ? upnpService.device!.friendlyName : "Service's device object not created yet"
            print("Removed service: \(upnpService.className) - \(friendlyName ?? "")")
>>>>>>> swift3
            
            _discoveredUPnPObjectCache[upnpService.usn] = upnpService
        }
    }
    
<<<<<<< HEAD
    private func deviceCountForTableSection(section: Int) -> Int {
        return section == 0 ? _archivedDeviceUSNs.count : _discoveredDeviceUSNs.count
    }
    
    private func deviceForIndexPath(indexPath: NSIndexPath) -> AbstractUPnPDevice {
=======
    fileprivate func deviceCountForTableSection(_ section: Int) -> Int {
        return section == 0 ? _archivedDeviceUSNs.count : _discoveredDeviceUSNs.count
    }
    
    fileprivate func deviceForIndexPath(_ indexPath: NSIndexPath) -> AbstractUPnPDevice {
>>>>>>> swift3
        let deviceUSN = indexPath.section == 0 ? _archivedDeviceUSNs[indexPath.row] : _discoveredDeviceUSNs[indexPath.row]
        let deviceCache = indexPath.section == 0 ? _archivedUPnPObjectCache : _discoveredUPnPObjectCache
        return deviceCache[deviceUSN] as! AbstractUPnPDevice
    }
    
<<<<<<< HEAD
    private func insertDevice(deviceUSN deviceUSN: UniqueServiceName, inout deviceUSNs: [UniqueServiceName], inSection section: Int) {
        let index = deviceUSNs.count
        deviceUSNs.insert(deviceUSN, atIndex: index)
        let indexPath = NSIndexPath(forRow: index, inSection: section)
        self._tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    private func deleteDevice(deviceUSN deviceUSN: UniqueServiceName, inout deviceUSNs: [UniqueServiceName], inSection section: Int) {
        if let index = deviceUSNs.indexOf(deviceUSN) {
            deviceUSNs.removeAtIndex(index)
            let indexPath = NSIndexPath(forRow: index, inSection: section)
            self._tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    private func performSSDPDiscovery() {
=======
    fileprivate func insertDevice(deviceUSN: UniqueServiceName, deviceUSNs: inout [UniqueServiceName], inSection section: Int) {
        let index = deviceUSNs.count
        deviceUSNs.insert(deviceUSN, at: index)
        let indexPath = IndexPath(row: index, section: section)
        self._tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    fileprivate func deleteDevice(deviceUSN: UniqueServiceName, deviceUSNs: inout [UniqueServiceName], inSection section: Int) {
        if let index = deviceUSNs.index(of: deviceUSN) {
            deviceUSNs.remove(at: index)
            let indexPath = IndexPath(row: index, section: section)
            self._tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    fileprivate func performSSDPDiscovery() {
>>>>>>> swift3
        if UPnAtom.sharedInstance.ssdpDiscoveryRunning() {
            UPnAtom.sharedInstance.restartSSDPDiscovery()
        }
        else {
            UPnAtom.sharedInstance.startSSDPDiscovery()
        }
    }
    
<<<<<<< HEAD
    private func archiveUPnPObjects() {
        _archivingUnarchivingQueue.addOperationWithBlock { () -> Void in
=======
    fileprivate func archiveUPnPObjects() {
        _archivingUnarchivingQueue.addOperation { () -> Void in
>>>>>>> swift3
            // archive discovered objects
            var upnpArchivables = [UPnPArchivableAnnex]()
            for (_, upnpObject) in self._discoveredUPnPObjectCache {
                var friendlyName = "Unknown"
                if let upnpDevice = upnpObject as? AbstractUPnPDevice {
                    friendlyName = upnpDevice.friendlyName
                }
                else if let upnpService = upnpObject as? AbstractUPnPService,
<<<<<<< HEAD
                    name = upnpService.device?.friendlyName {
                        friendlyName = name
                }
                
                let upnpArchivable = upnpObject.archivable(customMetadata: ["upnpType": upnpObject.className, "friendlyName": friendlyName])
                upnpArchivables.append(upnpArchivable)
            }
            
            let upnpArchivablesData = NSKeyedArchiver.archivedDataWithRootObject(upnpArchivables)
            NSUserDefaults.standardUserDefaults().setObject(upnpArchivablesData, forKey: RootFolderViewController.upnpObjectArchiveKeyOld)
            
            // show archive complete alert
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                let alertController = UIAlertController(title: "Archive Complete!", message: "Load archive and reload table view? If cancelled you'll see the archived devices on the next launch.", preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction) -> Void in
                    self.loadArchivedUPnPObjects()
                }))
                self.presentViewController(alertController, animated: true, completion: nil)
=======
                    let name = upnpService.device?.friendlyName {
                        friendlyName = name
                }
                
                let upnpArchivable = upnpObject.archivable(customMetadata: ["upnpType": upnpObject.className as AnyObject, "friendlyName": friendlyName as AnyObject])
                upnpArchivables.append(upnpArchivable)
            }
            
            let upnpArchivablesData = NSKeyedArchiver.archivedData(withRootObject: upnpArchivables)
            UserDefaults.standard.set(upnpArchivablesData, forKey: RootFolderViewController.upnpObjectArchiveKeyOld)
            
            // show archive complete alert
            OperationQueue.main.addOperation({ () -> Void in
                let alertController = UIAlertController(title: "Archive Complete!", message: "Load archive and reload table view? If cancelled you'll see the archived devices on the next launch.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction) -> Void in
                    self.loadArchivedUPnPObjects()
                }))
                self.present(alertController, animated: true, completion: nil)
>>>>>>> swift3
            })
        }
    }
    
<<<<<<< HEAD
    private func loadArchivedUPnPObjects() {
        // clear previously loaded archive devices
        if _archivedDeviceUSNs.count > 0 {
            var currentArchivedDeviceIndexes = [NSIndexPath]()
            for i: Int in 0 ..< _archivedDeviceUSNs.count {
                currentArchivedDeviceIndexes.append(NSIndexPath(forRow: i, inSection: 0))
            }
            
            _archivedDeviceUSNs.removeAll(keepCapacity: false)
            _tableView.deleteRowsAtIndexPaths(currentArchivedDeviceIndexes, withRowAnimation: .Automatic)
        }
        
        // clear archive model
        _archivedUPnPObjectCache.removeAll(keepCapacity: false)
        
        _archivingUnarchivingQueue.addOperationWithBlock { () -> Void in
            // load archived objects
            if let upnpArchivablesData = NSUserDefaults.standardUserDefaults().objectForKey(RootFolderViewController.upnpObjectArchiveKeyOld) as? NSData {
                let upnpArchivables = NSKeyedUnarchiver.unarchiveObjectWithData(upnpArchivablesData) as! [UPnPArchivableAnnex]
=======
    fileprivate func loadArchivedUPnPObjects() {
        // clear previously loaded archive devices
        if _archivedDeviceUSNs.count > 0 {
            var currentArchivedDeviceIndexes = [IndexPath]()
            for i: Int in 0 ..< _archivedDeviceUSNs.count {
                currentArchivedDeviceIndexes.append(NSIndexPath(row: i, section: 0) as IndexPath)
            }
            
            _archivedDeviceUSNs.removeAll(keepingCapacity: false)
            _tableView.deleteRows(at: currentArchivedDeviceIndexes, with: .automatic)
        }
        
        // clear archive model
        _archivedUPnPObjectCache.removeAll(keepingCapacity: false)
        
        _archivingUnarchivingQueue.addOperation { () -> Void in
            // load archived objects
            if let upnpArchivablesData = UserDefaults.standard.object(forKey: RootFolderViewController.upnpObjectArchiveKeyOld) as? Data {
                let upnpArchivables = NSKeyedUnarchiver.unarchiveObject(with: upnpArchivablesData) as! [UPnPArchivableAnnex]
>>>>>>> swift3
                
                for upnpArchivable in upnpArchivables {
                    let upnpType = upnpArchivable.customMetadata["upnpType"] as? String
                    let friendlyName = upnpArchivable.customMetadata["friendlyName"] as? String
<<<<<<< HEAD
                    print("Unarchived upnp object from cache \(upnpType) - \(friendlyName)")
                    
                    UPnAtom.sharedInstance.upnpRegistry.createUPnPObject(upnpArchivable: upnpArchivable, callbackQueue: NSOperationQueue.mainQueue(), success: { (upnpObject: AbstractUPnP) -> Void in
                        print("Re-created upnp object \(upnpObject.className) - \(friendlyName)")
=======
                    print("Unarchived upnp object from cache \(upnpType ?? "") - \(friendlyName ?? "")")
                    
                    UPnAtom.sharedInstance.upnpRegistry.createUPnPObject(upnpArchivable: upnpArchivable, callbackQueue: OperationQueue.main, success: { (upnpObject: AbstractUPnP) -> Void in
                        print("Re-created upnp object \(upnpObject.className) - \(friendlyName ?? "")")
>>>>>>> swift3
                        
                        self._archivedUPnPObjectCache[upnpObject.usn] = upnpObject
                        
                        if let upnpDevice = upnpObject as? AbstractUPnPDevice {
                            upnpDevice.serviceSource = self
                            
                            self.insertDevice(deviceUSN: upnpDevice.usn, deviceUSNs: &self._archivedDeviceUSNs, inSection: 0)
                        }
                        else if let upnpService = upnpObject as? AbstractUPnPService {
                            upnpService.deviceSource = self
                        }
                        }, failure: { (error: NSError) -> Void in
                            print("Failed to create UPnP Object from archive")
                    })
                }
            }
            else {
<<<<<<< HEAD
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
=======
                OperationQueue.main.addOperation({ () -> Void in
>>>>>>> swift3
                    self.performSSDPDiscovery()
                })
            }
        }
    }
}

extension RootFolderViewController: UITableViewDataSource {
<<<<<<< HEAD
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Archived Devices" : "Discovered Devices"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceCountForTableSection(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("DefaultCell") as UITableViewCell!
        let device = deviceForIndexPath(indexPath)
        cell.textLabel?.text = device.friendlyName
        cell.accessoryType = device is MediaServer1Device ? .DisclosureIndicator : .None
=======
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Archived Devices" : "Discovered Devices"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceCountForTableSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: "DefaultCell") as UITableViewCell?)!
        let device = deviceForIndexPath(indexPath as NSIndexPath)
        cell.textLabel?.text = device.friendlyName
        cell.accessoryType = device is MediaServer1Device ? .disclosureIndicator : .none
>>>>>>> swift3
        
        return cell
    }
}

extension RootFolderViewController: UITableViewDelegate {
<<<<<<< HEAD
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let device = deviceForIndexPath(indexPath)
=======
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let device = deviceForIndexPath(indexPath as NSIndexPath)
>>>>>>> swift3

        if let mediaServer = device as? MediaServer1Device {
            if mediaServer.contentDirectoryService == nil {
                print("\(mediaServer.friendlyName) - has no content directory service")
                return
            }
            
<<<<<<< HEAD
            let targetViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("FolderViewControllerScene") as! FolderViewController
=======
            let targetViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FolderViewControllerScene") as! FolderViewController
>>>>>>> swift3
            targetViewController.configure(mediaServer: mediaServer, title: "Root", contentDirectoryID: "0")
            self.navigationController?.pushViewController(targetViewController, animated: true)
            
            Player.sharedInstance.mediaServer = mediaServer
        }
        else if let mediaRenderer = device as? MediaRenderer1Device {
            if mediaRenderer.avTransportService == nil {
                print("\(mediaRenderer.friendlyName) - has no AV transport service")
                return
            }
            
            _toolbarLabel?.text = mediaRenderer.friendlyName
            Player.sharedInstance.mediaRenderer = mediaRenderer
        }
    }
}

extension RootFolderViewController: UPnPServiceSource {
    func service(forUSN usn: UniqueServiceName) -> AbstractUPnPService? {
        return _archivedUPnPObjectCache[usn] as? AbstractUPnPService
    }
}

extension RootFolderViewController: UPnPDeviceSource {
    func device(forUSN usn: UniqueServiceName) -> AbstractUPnPDevice? {
        return _archivedUPnPObjectCache[usn] as? AbstractUPnPDevice
    }
}
