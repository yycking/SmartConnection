import ElianSmartConnection
import OSLog

public class SmartConnection {
    private let context: UnsafeMutableRawPointer
    public private(set) var isBroadcasting = false
    
    public init?(SSID ssid: String?, password pw: String?, userInfo info: String?) {
        let target: [UInt8] = [0xff, 0xff, 0xff, 0xff, 0xff, 0xff]
        guard let _context = elianNew(nil, 0, target, UInt32(ELIAN_VERSION_V5)) else {
            os_log(.error, "elianNew failed")
            return nil
        }
        self.context = _context
        
        let ret = elianSetInterval(context, 10000, 10000)
        os_log(.info, "elianSetInterval %d", ret)
        
        var protoVer: Int32 = 0
        var libVersion: Int32 = 0
        elianGetVersion(&protoVer, &libVersion)
        os_log(.info, "elianGetVersion Proto:%d Library:%d", protoVer, libVersion)
        
        if let text = ssid?.utf8CString {
            var SSID: [Int8] = text.dropLast()
            let result = elianPut(context, TYPE_ID_SSID, &SSID, Int32(SSID.count))
            os_log(.info, "TYPE_ID_SSID %d", result)
        }
        
        if let text = pw?.utf8CString {
            var password: [Int8] = text.dropLast()
            let result = elianPut(context, TYPE_ID_PWD, &password, Int32(password .count))
            os_log(.info, "TYPE_ID_PWD %d", result)
        }
        
        if let text = info?.utf8CString {
            var userInfo: [Int8] = text.dropLast()
            let result = elianPut(context, TYPE_ID_CUST, &userInfo, Int32(userInfo.count))
            os_log(.info, "TYPE_ID_CUST %d", result)
        }
    }
    
    public func start() {
        guard !isBroadcasting else {
            return
        }
        isBroadcasting = true
        let result = elianStart(context)
        os_log(.info, "elianStart %d", result)
    }
    
    public func stop() {
        guard isBroadcasting else {
            return
        }
        isBroadcasting = false
        
        elianStop(context)
        os_log(.info, "elianStop")
    }
    
    deinit {
        elianStop(context)
        elianDestroy(context)
    }
}
