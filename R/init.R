# Initialization functions

startup_message <- "
   _|_|      _|_|_|  _|_|_|  _|        _|_|_|_|
 _|    _|  _|          _|    _|        _|
 _|_|_|_|  _|  _|_|    _|    _|        _|_|_|
 _|    _|  _|    _|    _|    _|        _|
 _|    _|    _|_|_|  _|_|_|  _|_|_|_|  _|_|_|_|

    _|_|    _|_|_|      _|_|      _|_|_|  _|        _|_|_|_|
 _|    _|  _|    _|  _|    _|  _|        _|        _|
 _|    _|  _|_|_|    _|_|_|_|  _|        _|        _|_|_|
 _|    _|  _|    _|  _|    _|  _|        _|        _|
   _|_|    _|    _|  _|    _|    _|_|_|  _|_|_|_|  _|_|_|_|
____________________________________________________________
Insights into software delivery performance.
"

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(startup_message)
}
