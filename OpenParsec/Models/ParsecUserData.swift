
struct ParsecUserDataVideo : Codable {
	var encoderFPS : Int = 0
	var resolutionX : Int = 0
	var resolutionY : Int = 0
	var fullFPS : Bool = false
	var hostOS = 0
	var output = "none"
	var encoderMaxBitrate : Int = 50
}

struct ParsecUserDataVideoConfig : Codable {
	var virtualMicrophone : Int = 0
	var virtualTablet : Int = 0
	var video : [ParsecUserDataVideo] = [
		ParsecUserDataVideo(),
		ParsecUserDataVideo(),
		ParsecUserDataVideo()
	]
}

struct ParsecDisplayConfig : Codable, Hashable {
	var name : String = ""
	var adapterName : String = ""
	var id : String = ""
}

enum ParsecUserDataType : UInt32 {
        case getVideoConfig = 9
        case getAdapterInfo = 10
        case setVideoConfig = 11
        /// Custom message for transmitting Apple Pencil events to the host
        case penInput = 100
}
