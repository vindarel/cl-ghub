(defpackage ghub
  (:use :cl
        :quri
        :jonathan)
  (:export :request))

(in-package :ghub)

(defparameter *ghub-base-url* "https://api.github.com")

(defun request (method resource &key params data (as :alist))
  "Do the http request and return an alist by default.

     (ghub:request :GET \"/repos/owner/project\") ;; beginning with a slash

- method: keyword :GET :POST,
- resource: api endpoint: \"/repos/owner/project\".
- params: alist of params: '((\"login\" . \"foo\")) will be url-encoded.
- data
- as: tells jonathan what data structure to return, alist by default.
"
  ;; to be sure, add header: Accept: application/vnd.github.v3+json
  (handler-case
      (let* ((p (and params (concatenate 'string "?" (url-encode-params params))))
             (d (and data (to-json data)))
             (url (str:concat *ghub-base-url* resource p))
             (s (dex:request url :method method :content d)))
        (parse s :as as))
    (error (c)
      (format *error-output* "Error requesting resource ~a: ~a~&" resource c))))
