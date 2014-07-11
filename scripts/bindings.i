%module bindings

%feature("intern_function", "lispify");

%insert("lisphead") %{
(in-package :nanomsg)
%}

%include "stdint.i"
typedef unsigned int size_t;

%include "/c/usr/local/nanomsg/include/nanomsg/nn.h"
%include "/c/usr/local/nanomsg/include/nanomsg/bus.h"
%include "/c/usr/local/nanomsg/include/nanomsg/inproc.h"
%include "/c/usr/local/nanomsg/include/nanomsg/ipc.h"
%include "/c/usr/local/nanomsg/include/nanomsg/pair.h"
%include "/c/usr/local/nanomsg/include/nanomsg/pipeline.h"
%include "/c/usr/local/nanomsg/include/nanomsg/pubsub.h"
%include "/c/usr/local/nanomsg/include/nanomsg/reqrep.h"
%include "/c/usr/local/nanomsg/include/nanomsg/survey.h"
%include "/c/usr/local/nanomsg/include/nanomsg/tcp.h"

