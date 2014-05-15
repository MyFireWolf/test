The net/url library gives us string->url, url-path, path/param-path, and url-query for getting
from a string to parts of the URL that it represents:
> (require xml net/url)
> (define u (string->url "http://localhost:8080/foo/bar?x=bye"))
> (url-path u)
'(#<path/param> #<path/param>)
> (map path/param-path (url-path u))
'("foo" "bar")
> (url-query u)
'((x . "bye"))
We use these pieces to implement dispatch. 
The dispatch function consults a hash table that maps an initial path element,
like "foo", to a handler function:

(define (dispatch str-path)
  ; Parse the request as a URL:
  (define url (string->url str-path))
  ; Extract the path part:
  (define path (map path/param-path (url-path url)))
  ; Find a handler based on the path's first element:
  (define h (hash-ref dispatch-table (car path) #f))
  (if h
      ; Call a handler:
      (h (url-query url))
      ; No handler found:
      `(html (head (title "Error"))
            (body
             (font ((color "red"))
                   "Unknown page: "
                   ,str-path)))))
 
(define dispatch-table (make-hash))
With the new require import and new handle, dispatch, and dispatch-table definitions,
our “Hello World!” server has turned into an error server. 
You don’t have to stop the server to try it out. After modifying "serve.rkt" with the new pieces,
evaluate (enter! "serve.rkt") and then try again to connect to the server.
The web browser should show an “Unknown page” error in red.

We can register a handler for the "hello" path like this:

(hash-set! dispatch-table "hello"
           (lambda (query)
             `(html (body "Hello, World!"))))
