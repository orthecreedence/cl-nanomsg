(defpackage #:nanomsg
  (:use :cffi)
  (:import-from :cl
                :in-package
                :t :nil
                :cons
                :lambda :let :if :cond :case :prog :when :unless
                :intern :export
                :defmacro
                :defun
                :&body :&key :&optional :&aux
                :labels
                :eval-when
                :loop :dotimes
                :string :concatenate :symbol-name
                :append
                :*package*
                :and :or
                :setf
                :defconstant
                :null :upper-case-p :lower-case-p :digit-char-p :char-equal :string= :listp
                :char-upcase :char-downcase
                :> :>= :< :<=
                :subseq
                :nreverse :list :list* :length :car :cdr :first :second
                :quote)
  (:nicknames :nn)
  (:shadow :close :symbol))

(defpackage #:nanomsg.accessors
  (:use :cl :cffi :nanomsg)
  (:nicknames :nn-a)
  (:shadowing-import-from :nanomsg
                          :close
                          :symbol))

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

