package gingham

import java.security.SecureRandom
import org.apache.commons.codec.binary.Hex

class Picture {
    String fileName
    byte[] fileData

    def beforeInsert() {
        def extension = getExtension(fileName)
        while(true) {
            fileName = createToken() + "." + extension;
            if(!Picture.findByFileName(fileName)) return
        }
    }

    String createToken(){
        byte[] bytes = new byte[16]
        def random = new SecureRandom()
        random.nextBytes(bytes)
        return Hex.encodeHex(bytes) as String
     }

    String getExtension(String fileName) {
        def matcher = /(.*)\.(.*)/
        if(!fileName ==~ matcher) throw new IllegalFormatException("File extension is not found.");
        return (fileName =~ matcher)[0][2]
    }

     static mapping = {
         fileData  type: "materialized_blob"
     }

    static constraints = {
        fileName blank:false, unique:true
        fileData blank:false
    }
}
