|%
++  check
  |=  [b=@ud n=@ud]
  :: prime bases have no Rhonda numbers
  ?:  (is-prime b)
    %.n
  =((calc-digits [(convert-to-base b n) %mul]) (mul b (calc-digits [(factorize n) %add])))

++  series
  |=  [b=@ud n=@ud]
  =/  number  1
  =/  numbers  `(list @ud)`[~]
  ?:  (is-prime b)
    ~
  |-
  ?:  =((lent numbers) n)
    numbers
  ?:  (check b number)
    $(numbers (snoc `(list @ud)`numbers number), number (add number 1))
  $(number (add number 1))

++  is-prime
  |=  n=@ud
  =/  counter  3
  |-
  ?:  |(=(n 1) =(n 2) =(n counter))
    %.y
  ?:  |(=((mod n 2) 0) =((mod n counter) 0)) 
    %.n
  $(counter (add counter 2))

++  next-prime
  |=  n=@ud
  ^-  @ud
  ?:  =(n 2)
    3
  =/  start  (add n 2)
  |-
  ?:  (is-prime start)
    start
  $(start (add start 2))

++  convert-to-base
  |=  [b=@ud n=@ud]
  ^-  (list @ud)
  =/  numbers  `(list @ud)`[~]
  =/  number  n
  |-
  =/  result  (dvr number b)
  =/  quotient  p.result
  =/  reminder  q.result
  ?:  =(quotient 0)
    (flop (snoc `(list @ud)`numbers reminder))
  $(number quotient, numbers (snoc `(list @ud)`numbers reminder))

++  factorize
   |=  n=@ud
   =/  numbers  `(list @ud)`[~]
   =/  factor  2
   =/  start  n
   ?:  =(n 1)
     [1 ~]
   |-
   =/  result  (dvr start factor)
   =/  quotient  p.result
   =/  reminder  q.result
   ?:  &(=(quotient 1) =(reminder 0))
     (snoc `(list @ud)`numbers factor)
   ?:  =(reminder 0)
     $(numbers (snoc `(list @ud)`numbers factor), start quotient)
   $(factor (next-prime factor))

++  calc-digits
  |=  data=$:(nums=(list @ud) op=$?(%mul %add))
  ^-  @ud
  ?:  .=(op.data %mul)
    (roll nums.data mul)
  ?:  .=(op.data %add)
    (roll nums.data add)  
  0
--
