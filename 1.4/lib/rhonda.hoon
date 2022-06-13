|%
++  check
  |=  [base=@ud num=@ud]
  ^-  $?(%.y %.n)
  :: skip checking prime here to make the series arm faster
  :: ?:  (is-prime base)  %.n
  .=
    (product-of-digits base num)
    (mul (sum-of-prime-factors num) base)
++  series
  |=  [base=@ud n=@ud]
  ^-  $?((list @ud) ~)
  ?:  (is-prime base)  ~
  :: smallest possible candidate
  =/  num  (mul base 2)
  =/  out  `(list @ud)`[~]
  |-
  ?:  =(n 0)  out
  ?:  (check base num)
  %=  $
    n    (sub n 1)
    out  (weld out ~[num])
    num  (add num 1)
  ==
  %=  $
    num  (add num 1)
  ==
++  is-prime
  |=  num=@ud
  ^-  $?(%.y %.n)
  ?:  (lth num 2)  %.n
  =/  p  2
  |-
  :: checking for factors up-to (sqrt num)
  ?:  (gth (mul p p) num)  %.y
  ?:  =((mod num p) 0)  %.n
  %=  $
    p  (add p 1)
  ==
++  sum-of-prime-factors
  |=  num=@ud
  ^-  $?(@ud ~)
  =/  p  2
  =/  s  0
  ?:  =(num 0)  ~
  |-
  ?:  =(num 1)  s
  ?:  =((mod num p) 0)
  %=  $
    num  (div num p)
    s    (add s p)
  ==
  %=  $
    p  ?:  (gth (mul p p) num)  num  (add p 1)
  ==
++  product-of-digits
  |=  [base=@ud num=@ud]
  ^-  @ud
  ?:  (lth base 2)  0
  =/  p  1
  |-
  ?:  =(num 0)  p
  %=  $
    p    (mul p (mod num base))
    num  (div num base)
  ==
--
