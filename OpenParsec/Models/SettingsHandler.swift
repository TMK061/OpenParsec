import Foundation
import UIKit

enum OrientationLock: Int, CaseIterable {
        case auto = 0
        case portrait
        case landscape

        var description: String {
                switch self {
                case .auto: return "Automatic"
                case .portrait: return "Portrait"
                case .landscape: return "Landscape"
                }
        }

        var mask: UIInterfaceOrientationMask {
                switch self {
                case .auto: return .all
                case .portrait: return .portrait
                case .landscape: return .landscape
                }
        }
}

struct SettingsHandler
{
	//public static var renderer:RendererType = .opengl
	public static var resolution : ParsecResolution = ParsecResolution.resolutions[1]
	public static var decoder:DecoderPref = .h264
	public static var cursorMode:CursorMode = .touchpad
	public static var cursorScale:Float = 0.5
	public static var mouseSensitivity : Float = 1.0
	public static var noOverlay:Bool = false
	public static var hideStatusBar:Bool = true
        public static var rightClickPosition:RightClickPosition = .firstFinger
        public static var lowPowerMode: Bool = false
        public static var autoReconnect: Bool = false
        public static var orientationLock: OrientationLock = .auto
	
	public static func load()
	{
		//if UserDefaults.standard.exists(forKey:"renderer")
		//	{ renderer = RendererType(rawValue:UserDefaults.standard.integer(forKey:"renderer"))! }
		if UserDefaults.standard.exists(forKey:"decoder")
			{ decoder = DecoderPref(rawValue:UserDefaults.standard.integer(forKey:"decoder"))! }
		if UserDefaults.standard.exists(forKey:"cursorMode")
			{ cursorMode = CursorMode(rawValue:UserDefaults.standard.integer(forKey:"cursorMode"))! }
		if UserDefaults.standard.exists(forKey:"rightClickPosition")
			{ rightClickPosition = RightClickPosition(rawValue:UserDefaults.standard.integer(forKey:"rightClickPosition"))! }
		if UserDefaults.standard.exists(forKey:"cursorScale")
			{ cursorScale = UserDefaults.standard.float(forKey:"cursorScale") }
		if UserDefaults.standard.exists(forKey:"mouseSensitivity")
		{ mouseSensitivity = UserDefaults.standard.float(forKey:"mouseSensitivity") }
                if UserDefaults.standard.exists(forKey:"noOverlay")
                        { noOverlay = UserDefaults.standard.bool(forKey:"noOverlay") }
                if UserDefaults.standard.exists(forKey:"hideStatusBar")
                { hideStatusBar = UserDefaults.standard.bool(forKey:"hideStatusBar") }
                if UserDefaults.standard.exists(forKey:"lowPowerMode") {
                        lowPowerMode = UserDefaults.standard.bool(forKey: "lowPowerMode")
                }
                if UserDefaults.standard.exists(forKey:"autoReconnect") {
                        autoReconnect = UserDefaults.standard.bool(forKey: "autoReconnect")
                }
                if UserDefaults.standard.exists(forKey:"orientationLock") {
                        orientationLock = OrientationLock(rawValue: UserDefaults.standard.integer(forKey: "orientationLock")) ?? .auto
                }
		
		if UserDefaults.standard.exists(forKey:"resolution") {
			for res in ParsecResolution.resolutions {
				if res.desc == UserDefaults.standard.string(forKey: "resolution") {
					resolution = res
					break
				}
			}
		}
	}
	
	public static func save()
	{
		//UserDefaults.standard.set(renderer.rawValue, forKey:"renderer")
		UserDefaults.standard.set(decoder.rawValue, forKey:"decoder")
		UserDefaults.standard.set(cursorMode.rawValue, forKey:"cursorMode")
		UserDefaults.standard.set(rightClickPosition.rawValue, forKey:"rightClickPosition")
		UserDefaults.standard.set(cursorScale, forKey:"cursorScale")
		UserDefaults.standard.set(mouseSensitivity, forKey: "mouseSensitivity")
                UserDefaults.standard.set(noOverlay, forKey:"noOverlay")
                UserDefaults.standard.set(resolution.desc, forKey:"resolution")
                UserDefaults.standard.set(hideStatusBar, forKey: "hideStatusBar")
                UserDefaults.standard.set(lowPowerMode, forKey: "lowPowerMode")
                UserDefaults.standard.set(autoReconnect, forKey: "autoReconnect")
                UserDefaults.standard.set(orientationLock.rawValue, forKey: "orientationLock")
        }
}

extension UserDefaults
{
	/**
	 * Checks if a specified key exists within this UserDefaults.
	 */
	func exists(forKey:String) -> Bool
	{
		return object(forKey:forKey) != nil
	}
}
