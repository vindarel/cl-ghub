#|
  This file is a part of ghub project.
|#

(in-package :cl-user)
(defpackage ghub-asd
  (:use :cl :asdf))
(in-package :ghub-asd)

(defsystem "ghub"
  :version "0.1.0"
  :author "vindarel"
  :license "MIT"
  :depends-on (:jonathan
               :dexador
               :quri
               :str)
  :components ((:module "src"
                :components
                ((:file "ghub"))))
  :description ""
  :in-order-to ((test-op (test-op "ghub-test"))))
