cl-nanomsg
==========
[nanomsg](http://nanomsg.org/index.html) is the spiritual successor to 0mq. It's
written in C, so has a smaller profile and also a simpler API. This project
provides a set of *low level* bindings to the library.

## Usage

Until I write docs (which I never do for my binding libs), read bindings.lisp or
use the following patterns for general usage:

```lisp
(let* ((sock (nn:socket nn:+af-sp+ nn:+nn-pair+))
       (conn (nn:connect sock "inproc://mysock"))
       (msg (babel:string-to-octets "send me.")))
  (cffi:with-foreign-object (buf :unsigned-char (length msg))
    (dotimes (i (length msg))
      (setf (cffi:mem-aref buf :unsigned-char i) (aref msg i)))
    (nn:send sock buf (length msg))
    (nn:shutdown sock conn)
    (nn:close sock)))
```

## License

MIT.

