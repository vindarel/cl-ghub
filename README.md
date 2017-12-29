# Ghub - a minuscule Github api v3 client

In progress. The one function works, we'll see if and how we use this !

This lib does not map functions to api endpoints, it is of the
developper to write correct api calls, so this lib is already complete
!. See https://developer.github.com/v3/


## Installation

Clone where Quicklisp can find this (`~/quicklisp/local-projects`) and
`(ql:quickload "ghub")` it.

## Usage

     (ghub:request :GET "/repos/owner/project") ;; beginning with a slash

and optional `:params` and `:data` alists. Returns an alist.

Easy, no authentication required.

On error, it prints the error message on `*error-output*` and returns nil.

## See also

- https://github.com/hanshuebner/cl-github-v3/ - defines a couple functions for api actions. Uncomplete.
- https://gitlab.com/vindarel/cl-gitlab (unused so far).
- https://github.com/Shinmera/legit - git interface.

Inspiration from Tarsius' ghub.el.

---

- http://lisp-lang.org/
- https://github.com/CodyReichert/awesome-cl
- https://lispcookbook.github.io/cl-cookbook/
- and my https://lisp-journey.gitlab.io/blog/
