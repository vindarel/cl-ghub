(defpackage ghub
  (:use :cl
        :quri
        :str
        :jonathan)
  (:export :request))

(in-package :ghub)

(defparameter *ghub-base-url* "https://api.github.com")

(defun request (method resource &key params data)
  "Do the http request and return the json.
method: keyword :GET :POST,
resource: api endpoint
params: alist of params: '((\"login\" . \"foo\")) will be url-encoded.

Return: an alist."
  ;; to be sure, add header: Accept: application/vnd.github.v3+json
  (handler-case
      (let* ((p (and params (concatenate 'string "?" (url-encode-params params))))
             (d (and data (to-json data)))
             (url (str:concat *ghub-base-url* resource p))
             (s (dex:request url :method method :content d)))
        (parse s :as :alist))
    (error ()
      (format *error-output* "Error decoding json for resource ~a.~&" resource))))
