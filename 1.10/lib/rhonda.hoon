|%
++  check
  |=  [b=@ud n=@ud]
  =((baseprod b n) (mul b (sopf n)))
++  series
  |=  [b=@ud n=@ud]
  =/  count=@  0
  =/  num=@ud  1
  =|  ser=(list @ud)
  ?:  (is-prime b)
    ~
  |-
  ?:  =(count n)
    ser
  ?:  (check b num)
    $(ser (weld ser ~[num]), count +(count), num +(num))
  $(num +(num))
++  is-prime
  |=  b=@ud
  =/  d=@ud  3
  =/  q  -:(sqt b)
  ?:  =((mod b 2) 0)
    %.n
  |-
  ?:  (gth d q)
    %.y
  ?:  =((mod b d) 0)
    %.n
  $(d (add d 2))
++  baseprod
  |=  [b=@ud n=@ud]
  =/  prod=@ud  1
  =/  left=@ud  n
  |-
  ?:  (lth left b)
    (mul prod left)
  $(left (div left b), prod (mul prod (mod left b)))
++  sopf
  |=  n=@ud
  =/  [left=@ud sum=@ud]  (twos n)
  (add sum (odds left))
++  twos
  |=  n=@ud
  =/  left=@ud  n
  =/  sum=@ud  0
  |-
  ?:  =((mod left 2) 0)
    $(left (div left 2), sum (add sum 2))
  [left sum]
++  odds
  |=  n=@ud
  =/  left=@ud  n
  =/  odd=@ud  3
  =/  sum=@ud  0
  |-
  ?:  =(left 1)
    sum
  ?:  =((mod left odd) 0)
    $(left (div left odd), sum (add sum odd))
  $(odd (add odd 2))
--
