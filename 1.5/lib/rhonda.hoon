|%
++  check
  |=  [b=@ud n=@ud]
  ^-  ?
  =((product-of-digits b n) (mul b (roll (prime-factors n) add)))
++  series
  |=  [b=@ud n=@ud]
  ^-  (list @ud)
  ?:  =(1 (lent (prime-factors b)))
    ~
  =/  i  560
  |-
  ?:  =(n 0)
    ~
  ?.  (check b i)
    $(i +(i))
  [i $(n (dec n), i +(i))]
++  product-of-digits
  |=  [b=@ud n=@ud]
  ^-  @ud
  =/  result  1
  |-
  ?:  =(n 0)
    result
  =+  (dvr n b)
  $(n p, result (mul result q))
++  prime-factors
  |=  n=@ud
  ^-  (list @ud)
  =|  result=(list @ud)
  |-
  =+  (dvr n 2)
  ?:  =(q 0)
    $(n p, result [2 result])
  =/  factor  3
  |-
  ?:  (gth (mul factor factor) n)
    ?:  (gth n 2)
      [n result]
    result
  =+  (dvr n factor)
  ?:  =(q 0)
    $(n p, result [factor result])
  $(factor (add factor 2))
--
