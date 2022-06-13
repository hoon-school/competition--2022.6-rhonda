|%
++  conv-base
  |=  [b=@ud a=@ud]
  ^-  (list @ud)
  ?.  (gth b 1)     
    ~|  'Base b must be greater than 1'  !!
  %-  flop
  |-  
  ?:  =(a 0)
    ~
  [(mod a b) $(a (div a b))]

++  prime-factors
  |=  [a=@ud]
  ^-  (list @ud)
  =/  b  2
  |-
  ?:  (gth b -:(sqt a))
    [a ~]
  ?.  =(0 (mod a b))
    $(b +(b))
  [b $(a (div a b))]

++  is-prime
  |=  [a=@ud]
  =/  b  (prime-factors a)
  ?:  =(1 (lent b))  
    %.y
  %.n

++  check
  |=  [b=@ud a=@ud]
  =/  c  (mul (roll (prime-factors a) add) b)
  =/  d  (roll (conv-base b a) mul)
  ?:  =(c d)
    %.y
  %.n

++  series
  |=  [b=@ud n=@ud]
  ^-  (list @ud)
  ?:  (is-prime b)  
    ~
  ::  '560' is the smallest rhonda number
  ::
  =/  a  560
  =/  ctr  0
  |-
  ?:  (gte ctr n)
    ~
  ?:  (check b a)
    [a $(a +(a), ctr +(ctr))]
  $(a +(a))
--
