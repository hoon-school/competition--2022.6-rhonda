|%
::
:: Check to see if the number and base are a rhonda number
++  check
  |=  [base=@ud number=@ud]
  ^-  bean
  ?:  =((product-of-base [base number]) (mul base (sum-of-primes [number])))  %.y  %.n
::
:: Check if base is prime, if not, returns n count of rhonda numbers of the provided base
:: SERIES DOES NOT WORK YET
++  series
  |=  [base=@ud n=@ud]  
  ^-  @ud
  ?:  (is-prime base)  0  1
::
:: Below is helper functinos for check
++  product-of-base
  |=  [base=@ud number=@ud]
  =/  prod  1
  |-
  ?:  =(number 0)
    prod
  %=  $
    prod  (mul prod (mod number base))
    number  (div number base)
  ==
::
:: Below is helper functinos for check
++  sum-of-primes
  |=  [number=@ud]
  =/  sum  0
  =/  i  3
  |-
  ?:  !=((mod number 2) 0)
    |-
    ?:  =(i p:(sqt number))
      |-
      ?:  !=((mod number i) 0)
        ?:  (gth number 2)
          (add sum number)
        sum
      %=  $
        sum  (add sum i)
        number  (div number i)
      ==
    %=  $
      i  (add i 2)
    ==
  %=  $
    sum  (add sum 2)
    number  (div number 2)
  ==
::
:: Prime checker for series
++  is-prime
  |=  [base=@ud]
  =/  i  2
  ^-  bean
  ?:  (lte base 1)
    %.n
  ?:  =(base 2)
    %.y
  ?:  =(base 3)
    %.y
  |-
  ?:  =(i p:(sqt base))
    %.y
  ?:  =((mod base i) 0)
    %.n
  %=  $
    i  +(i)
  ==
--
