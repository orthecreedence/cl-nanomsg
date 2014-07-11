cl-nanomsg
==========
[nanomsg](http://nanomsg.org/index.html) is the spiritual successor to 0mq. It's
written in C, so has a smaller profile and also a simpler API. This project
provides a set of *low level* bindings to the library.

## Usage

Until I write docs (which I never do for my binding libs), read bindings.lisp or
use the following patterns for general usage:

```lisp
;; send a message via a new sock, and perform cleanup after done
(let* ((sock (nn:socket nn:+af-sp+ nn:+nn-pair+))
       (conn (nn:connect sock "inproc://mysock"))
       (msg (babel:string-to-octets "send me.")))
  (cffi:with-foreign-object (buf :unsigned-char (length msg))
    (dotimes (i (length msg))
      (setf (cffi:mem-aref buf :unsigned-char i) (aref msg i)))
    (nn:send sock buf (length msg))
    (nn:shutdown sock conn)
    (nn:close sock)))

;; grab the underlying FD from a nanomsg sock (which can be used in an event
;; loop like cl-async)
(let ((sock (nn:socket nn:+af-sp+ nn:+nn-pair+)))
  (cffi:with-foreign-objects ((pt :pointer)
                              (size :int))
    (setf (cffi:mem-aref size :int) (cffi:foreign-type-size :long))
    (nn:getsockopt sock nn:+nn-sol-socket+ nn:+nn-rcvfd+ pt size)
    (cffi:mem-aref pt :long)))
```

## License

MIT.

