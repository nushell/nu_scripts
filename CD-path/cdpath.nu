def-env c [dir = ""] {
    let CDPATH = [(build-string $env.HOME "/"), "/", "/home/skelly37/it/", (build-string $env.HOME "/.config/"), (build-string $env.PWD "/")]
    let TMP_FILENAME = "/tmp/cdpath-cache-nu"

		if ($dir == "") {
			if ($TMP_FILENAME | path exists) {
				rm -q $TMP_FILENAME
			}

			echo $env.HOME | save $TMP_FILENAME

		} else {
    		for p in $CDPATH {
        	let destination = (build-string $p $dir)
        	if ($destination | path exists) {
        			if ($TMP_FILENAME | path exists) {
            		rm -q $TMP_FILENAME
 							}
        	    echo $destination | save $TMP_FILENAME
      	  }
    	}
    }
   if ($TMP_FILENAME | path exists) {} else {
			error make {msg: "No such path"}
    }
   let d = open $TMP_FILENAME
	 let-env PWD = $d
   rm -q $TMP_FILENAME
}
