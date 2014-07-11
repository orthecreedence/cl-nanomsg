(in-package :nanomsg.accessors)

(defmacro make-accessors (c-struct)
  `(progn
     ,@(loop for slot-name in (foreign-slot-names (intern (string c-struct) :nanomsg))
             for accessor-name = (intern (concatenate 'string (symbol-name c-struct)
                                                      "-"
                                                      (symbol-name slot-name)))
             append (list `(defmacro ,accessor-name (ptr)
                             (list 'foreign-slot-value ptr '',(intern (string c-struct) :nanomsg) '',slot-name))
                          `(export ',accessor-name :nanomsg.accessors)))))

(make-accessors #.(nanomsg::lispify "nn_symbol_properties" 'classname))
(make-accessors #.(nanomsg::lispify "nn_iovec" 'classname))
(make-accessors #.(nanomsg::lispify "nn_msghdr" 'classname))
(make-accessors #.(nanomsg::lispify "nn_cmsghdr" 'classname))
(make-accessors #.(nanomsg::lispify "nn_pollfd" 'classname))
