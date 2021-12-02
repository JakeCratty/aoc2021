package utils;

import sys.io.File;

using StringTools;

class FileServices {
    /** Extract text from file, trim leading/tailing whitespace, split by delim **/
    static inline public function textAsArray(url:String, ?delim="\n") {
        return FileServices.getText(url).trim().split(delim);
    }

    static inline public function getText(url:String) {
        return File.getContent(url);
    }
}