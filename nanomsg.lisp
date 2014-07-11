(defpackage #:nanomsg
  (:use :cl :cffi)
  (:nicknames :nn)
  (:shadow :close))

(defpackage #:nanomsg.accessors
  (:use :cl :cffi :nanomsg)
  (:nicknames :nn-a)
  (:shadowing-import-from :nanomsg
                          :close))

(in-package :nanomsg)

(eval-when (:load-toplevel)
  (define-foreign-library nanomsg
    (:darwin (:or "nanomsg.dylib"))
    (:unix (:or "nanomsg.so"
                "/usr/lib/nanomsg.so"
                "/usr/local/lib/nanomsg.so"
                ; brew's install of libevent on Mac OX X
                "/usr/local/lib/nanomsg.dylib"))
    (:windows (:or "nanomsg.dll"))
    (t (:default "nanomsg")))
  (unless (foreign-library-loaded-p 'nanomsg)
    (use-foreign-library nanomsg)))

