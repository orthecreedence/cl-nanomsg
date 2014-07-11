(asdf:defsystem cl-nanomsg
  :author "Andrew Danger Lyon <orthecreedence@gmail.com>"
  :license "MIT"
  :version "0.1.1"
  :description "Low-level nanomsg bindings for Common Lisp."
  :depends-on (#:cffi)
  :components ((:file "nanomsg")
               (:file "wrapper" :depends-on ("nanomsg"))
               (:file "bindings" :depends-on ("wrapper"))
               (:file "exports" :depends-on ("bindings"))
               (:file "accessors" :depends-on ("exports"))))

